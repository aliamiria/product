import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/state/request_state.dart';
import 'package:untitled10/core/theme/app_colors.dart';
import 'package:untitled10/product/presentation/manager/product_bloc.dart';
import 'package:untitled10/product/presentation/widgets/category_names_section.dart';
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
        padding: EdgeInsetsDirectional.symmetric(horizontal: 18.w, vertical: 10.h),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          height: 484.h,
                          child: ListView.builder(
                            itemCount: state.categories.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  EdgeInsets.symmetric(
                                  vertical: 3.w,
                                ),
                                child: ChoiceChip(
                                  onSelected: (value) {
                                    setState(() {
                                      name = state.categories.data![index].name;
                                    });
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

                                  selectedColor: AppColors.primary,
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
                  SizedBox(
                    height: 600.h,
                    width: 250.w,
                    child: ListView.builder(

                      itemBuilder: (context, index) {
                           return  Container(margin: EdgeInsets.all(10),color: Colors.red,child: Text('data'));
                      },
                    ),
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
