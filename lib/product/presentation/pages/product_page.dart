import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/product/presentation/pages/product%20_details_page.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/state/request_state.dart';
import '../../../core/theme/app_colors.dart';
import '../manager/product_bloc.dart';
import '../widgets/product_widget.dart';
import '../widgets/text_field_widget.dart';
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductsEvent());
    super.initState();
  }

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AssetConstants.logo),
        title: Text(
          'كل المنتجات',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.notification_add_outlined),
          SizedBox(width: 10),
          Icon(Icons.shopping_basket_outlined),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 10.h,
                horizontal: 10.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFieldWidget(
                    onChanged: (p0) {
                      context.read<ProductBloc>().add(
                        SearchProductEvent(q: p0),
                      );
                    },
                    textEditingController: textEditingController,
                    width: 295.w,
                    height: 50.h,
                    hint: "ابحث عن الماركات، العطور، الأزياء...",
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return ['حسب الاسم', 'حسب السعر', 'حسب التقييم'].map((e) {
                        return PopupMenuItem(
                          child: Text('$e'),
                          value: e,
                          onTap: () {
                            if (e == 'حسب الاسم') {
                              context.read<ProductBloc>().add(
                                SortProductEvent(title: 'title', order: 'desc'),
                              );
                            } else if (e == 'حسب السعر') {
                              context.read<ProductBloc>().add(
                                SortProductEvent(title: 'price', order: 'desc'),
                              );
                            } else if (e == 'حسب التقييم') {
                              context.read<ProductBloc>().add(
                                SortProductEvent(title: 'rating', order: 'desc'),
                              );
                            }
                          },
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state.products.status == Status.loading) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state.products.status == Status.error) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.products.error)),
                );
              } else if (state.products.status == Status.success ||
                  state.searchProduct.status == Status.success ) {
                final bool isSearching =
                    textEditingController.text.trim().isNotEmpty;

                final pro = state.sortProduct.status == Status.success
                    ? state.sortProduct.data
                    : isSearching
                    ? state.searchProduct.data
                    : state.products.data;
                if (state.searchProduct.status == Status.loading) {
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (pro!.products.isEmpty) {
                  return SliverToBoxAdapter(child: Text('المنتج غير متوفر'));
                }

                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: pro!.products.length,
                    (context, index) {
                      return ProductWidget(
                        image: pro.products[index].images[0],
                        title: pro.products[index].title,
                        brand: pro.products[index].brand??'not found',
                        price: pro.products[index].price,
                        rate: pro.products[index].rating,
                        onTap: () {
                          final productBloc = context.read<ProductBloc>();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => BlocProvider.value(
                                    value: productBloc,
                                    child: ProductDetailsPage(
                                      id: pro.products[index].id,
                                    ),
                                  ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 150.w / 290.h,
                  ),
                );
              } else {
                return SliverToBoxAdapter(child: SizedBox.shrink());
              }
            },
          ),
        ],
      ),
    );
  }
}
