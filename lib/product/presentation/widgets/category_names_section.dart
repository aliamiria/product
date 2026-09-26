import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/state/request_state.dart';
import '../../../core/theme/app_colors.dart';
import '../manager/product_bloc.dart' ;

class CategoryNamesSection extends StatefulWidget {
  const CategoryNamesSection({super.key});

  @override
  State<CategoryNamesSection> createState() => _CategoryNamesSectionState();
}

class _CategoryNamesSectionState extends State<CategoryNamesSection> {
  String name = ' ';
  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.namesCategory.status == Status.loading) {
            return Center(child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                children: [
                  Container(height: 50, color: Colors.white),
                  const SizedBox(height: 16),

                ],
              ),
            ));
          } else if (state.namesCategory.status == Status.error) {
            return Text(state.namesCategory.error);
          } else {
            return SizedBox(
              height: 50.h,
              child: ListView.builder(
                itemCount: state.namesCategory.data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                    ),
                    child: ChoiceChip(
                      onSelected: (value) {
                        setState(() {
                          name = state.namesCategory.data![index];
                        });
                      },

                      label: Text(state.namesCategory.data![index]),
                      selected:
                      name == state.namesCategory.data![index],
                      showCheckmark: false,
                      selectedColor: AppColors.secondary,
                      labelStyle: name == state.namesCategory.data![index]
                          ? TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      )
                          : TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: AppColors.tertiary.withAlpha(50),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
