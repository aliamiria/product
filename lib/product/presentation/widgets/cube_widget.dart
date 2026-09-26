import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class CubeWidget extends StatelessWidget {
  const CubeWidget({super.key, required this.time});
final int time;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(5.r),
      height: 45.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: AppColors.pink.withAlpha(80),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(child: Text(time.toString(),style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: 17.sp),)),
    );
  }
}
