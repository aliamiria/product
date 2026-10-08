import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled10/product/presentation/manager/cart_provider.dart';
import 'package:untitled10/product/presentation/manager/product_bloc.dart';
import 'package:untitled10/product/presentation/pages/product%20_details_page.dart';

import '../../../core/theme/app_colors.dart';
import '../widgets/product_widget.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              final prod = state.products.data;
              if (prod == null) {
                return  SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final ids = context.watch<CartProvider>().add;
              final items = prod.products
                  .where((element) => ids.contains(element.id))
                  .toList();

              if (items.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: Text('السلة فاضية')),
                );
              }

              return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: items.length,
                      (context, index) {
                    final item = items[index];
                    return Stack(
                      children: [
                      ProductWidget(
                      id: item.id,
                      image: item.images[0],
                      title: item.title,
                      brand: item.brand ?? 'not found',
                      price: item.price,
                      rate: item.rating,
                      onTap: () {
                        final productBloc = context.read<ProductBloc>();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: productBloc,
                              child: ProductDetailsPage(id: item.id),
                            ),
                          ),
                        );
                      },
                    ),
                        Positioned(top: 317.h,
                            right: 80.w,
                            child: InkWell(
                            child:Consumer<CartProvider>(builder: (context, value, child) =>IconButton(
                              icon: Container(
                                height: 35.h,
                                width: 35.w,
                                decoration: BoxDecoration(
                                  color: Color(0x99e2dfff).withAlpha(120),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Icon(
                                  Icons.delete,
                                  color: AppColors.primary,
                                ),
                              ),
                              onPressed: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 2),
                                      backgroundColor: AppColors.primary,
                                      content:
                                      Text(
                                        "تمت الحذف: ${item.title}",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                );
                                context.read<CartProvider>().remove(item.id);
                              },

                            ) ,)))
                      ],
                    );

                  },
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 148.w / 290.h,
                  crossAxisCount: 2,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}