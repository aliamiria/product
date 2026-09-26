import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../pages/category_page.dart';

class ImportantCategorySection extends StatelessWidget {
   ImportantCategorySection({super.key});
  List<String> images = [
    AssetConstants.beauty,
    AssetConstants.perfume,
    AssetConstants.chair,
    AssetConstants.food,
    AssetConstants.mod,
  ];
  List<Color> colors = [
    Color(0x80ffdadb),
    Color(0x99e2dfff),
    Color(0xffDCE9FF),
    Color(0x9989f5e7),
    Color(0x33dc2c4f),
  ];
  List<String> categoryNames = [
    "Beauty",
    "Perfumes",
    "Home Decoration",
    "Fresh Foods",
    "Sold",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الأقسام المميزة",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CategoryPage();
                      },
                    ),
                  );
                },
                child: Text(
                  "عرض الكل",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 110.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.r),
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: colors[index],

                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(images[index]),
                  ),
                  Text(
                    categoryNames[index],
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
