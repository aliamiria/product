import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled10/product/presentation/manager/favorite_provider.dart';

import '../../../core/theme/app_colors.dart';
import '../manager/cart_provider.dart';

class ProductWidget extends StatefulWidget {
    ProductWidget({super.key, required this.image, required this.title, required this.brand, required this.price,required this.onTap, required this.rate, required this.id});
   bool isFavorite = false;
   final String image;
   final String title;
   final String brand;
   final double price;
   final double rate;
   final int id ;
   final void Function() onTap;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:  widget.onTap,
      child: Container(
        margin: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0xff919191),
              offset: Offset(3, 3),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.symmetric(
                vertical: 20.h,
              ),
              width: 150.w,
              height: 210.h,
              decoration: BoxDecoration(
                color: Color(0x99e2dfff).withAlpha(60),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Consumer<FavoriteProvider>(

                  builder:(context, value, child) =>  IconButton(
                      onPressed: () {
                       context.read<FavoriteProvider>().toggleFav(widget.id);
                      },
                      icon: Icon(
                     value.isFav(widget.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:    value.isFav(widget.id)
                            ? Colors.red
                            : AppColors.natural,
                      ),
                    ),
                  ),
                  Image.network(
                   widget. image,
                  ),
                ],
              ),
            ),
          Text(
             widget.brand,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ) ,
            Text(
              textAlign: TextAlign.center,
           widget.  title,
              maxLines: 1,
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.natural,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 3.h,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.gold,
                    size: 20.r,
                  ),
                  Text(
                 widget.rate.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    '\$${widget.price}',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                    ),
                  ),
                ),
                InkWell(
                  child:Consumer<CartProvider>(builder: (context, value, child) =>IconButton(
                    icon: Container(
                      height: 35.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        color: Color(0x99e2dfff).withAlpha(120),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.add,
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
                            "تمت الاضافة: ${widget.title}",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      );
                      context.read<CartProvider>().toggle(widget.id);
                    },

                  ) ,)),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
