import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled10/core/state/request_state.dart';
import 'package:untitled10/core/theme/app_colors.dart';
import 'package:untitled10/product/presentation/manager/product_bloc.dart';
import 'package:untitled10/product/presentation/widgets/category_names_section.dart';
import 'package:untitled10/product/presentation/widgets/product_widget.dart';
import 'package:untitled10/product/presentation/widgets/text_field_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetNamesCategoriesEvent());
    context.read<ProductBloc>().add(GetCategoryEvent());
    super.initState();
  }

  String name = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 18.w,
          vertical: 10.h,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: TextFieldWidget(
                width: 320.w,
                height: 60.h,
                hint: 'ابحث عن قسم، ماركة، أو منتج...',
              ),
            ),
            CategoryNamesSection(),
            SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state.categories.status == Status.loading) {
                        return CircularProgressIndicator();
                      } else if (state.categories.status == Status.error) {
                        return Text(state.categories.error);
                      } else if (state.categories.status == Status.success) {
                        return SizedBox(
                          width: 80.w,
                          height: 560.h,
                          child: ListView.builder(
                            itemCount: state.categories.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.w),
                                child: ChoiceChip(
                                  onSelected: (value) {
                                    setState(() {
                                      name = state.categories.data![index].name;
                                    });
                                    context.read<ProductBloc>().add(
                                      GetProductsByCategoriesEvent(name: name),
                                    );
                                  },

                                  label: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.tertiary.withAlpha(
                                            90,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),

                                        width: 46.w,
                                        height: 46.h,
                                        child: Icon(
                                          Icons.add,
                                          color:
                                              name ==
                                                      state
                                                          .categories
                                                          .data![index]
                                                          .name
                                                  ? AppColors.white
                                                  : AppColors.natural,
                                        ),
                                      ),
                                      Text(
                                        state.categories.data![index].name,
                                        style: TextStyle(
                                          color:
                                              name ==
                                                      state
                                                          .categories
                                                          .data![index]
                                                          .name
                                                  ? AppColors.white
                                                  : AppColors.natural,
                                        ),
                                      ),

                                      Text(
                                        '142 منتج',
                                        style: TextStyle(
                                          color:
                                              name ==
                                                      state
                                                          .categories
                                                          .data![index]
                                                          .name
                                                  ? AppColors.white
                                                  : AppColors.natural,
                                        ),
                                      ),
                                    ],
                                  ),

                                  selectedColor: AppColors.natural,
                                  selected:
                                      name ==
                                      state.categories.data![index].name,
                                  showCheckmark: false,
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                  SizedBox(width: 15.w),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state.productsByCategory.status == Status.loading) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Column(

                            children: [SizedBox(height: 400, width: 50)],
                          ),
                        );
                      } else if (state.productsByCategory.status ==
                          Status.error) {
                        return Text(state.productsByCategory.error);
                      } else if (state.productsByCategory.status ==
                          Status.success) {
                        if (name == '') {
                          return Text('No Category Selected');
                        }
                        if (state.productsByCategory.data!.products.isEmpty) {
                          return Center(
                            child: Padding(
                              padding:  EdgeInsets.only(right: 40.0.r),
                              child: Text('لا يوجد منتجات مختارة لهذا الصنف'),
                            ),
                          );
                        }
                        return SizedBox(
                          height: 600.h,
                          width: 250.w,
                          child: ListView.builder(
                            itemCount:
                                state.productsByCategory.data!.products.length,
                            itemBuilder: (context, index) {
                              return ProductWidget(
                                image:
                                    state
                                        .productsByCategory
                                        .data!
                                        .products[index]
                                        .images[0],
                                title:
                                    state
                                        .productsByCategory
                                        .data!
                                        .products[index]
                                        .title,
                                brand:
                                    state
                                        .productsByCategory
                                        .data!
                                        .products[index]
                                        .brand ??
                                    '',
                                price:
                                    state
                                        .productsByCategory
                                        .data!
                                        .products[index]
                                        .price,
                                onTap: () {},
                                rate:
                                    state
                                        .productsByCategory
                                        .data!
                                        .products[index]
                                        .rating,
                              );
                            },
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
