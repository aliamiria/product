import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/theme/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.width,
    required this.height,
    required this.hint,
  });

  final double width;

  final double height;

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.white,
      ),
      child: TextField(
        cursorColor: AppColors.primary,
        decoration: InputDecoration(suffixIcon: Icon(Icons.keyboard_voice_outlined),prefixIcon: Icon(Icons.search_outlined),border: InputBorder.none, hintText: hint),
      ),
    );
  }
}
