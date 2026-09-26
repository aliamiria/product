import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/theme/app_colors.dart';
import 'cube_widget.dart';

class CardSection extends StatelessWidget {
  const CardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          AssetConstants.card,
width: 500.w,
        ),
        Positioned(
          right: 30.w,
          top: 10.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 35.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: AppColors.pink.withAlpha(80),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: AppColors.pink,
                    ),
                    Text(
                      "تخفيضات الموسم الكبرى",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "عروض الصيف الفاخرة",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              Text(
                "خصومات حصرية استثنائية تصل إلى 50%",
                style: TextStyle(
                  color: AppColors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    "ينتهي خلال :",
                    style: TextStyle(
                      color: AppColors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),

                  CubeWidget(time: 12),
                  Text(
                    ":",
                    style: TextStyle(
                      color: AppColors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CubeWidget(time: 8),
                  Text(
                    ":",
                    style: TextStyle(
                      color: AppColors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CubeWidget(time: 24),
                ],
              ),
              SizedBox(height: 5.h),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "تسوق الآن",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: AppColors.primary,
                      size: 20.r,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
