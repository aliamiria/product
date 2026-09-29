import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/constants/asset_constants.dart';
import 'package:untitled10/core/state/request_state.dart';
import 'package:untitled10/core/theme/app_colors.dart';

import '../manager/product_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.id});

  final int id;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();

    context.read<ProductBloc>().add(GetSingleProductEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.product.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.product.status == Status.error) {
            return Center(child: Text(state.product.error));
          }

          if (state.product.status == Status.success) {
            final pro = state.product.data!;
            final reviews = pro.reviews;
            final satisfied =
                reviews.where((review) => review.rating >= 4).length;
            final percentage =
                reviews.isEmpty
                    ? 0
                    : (satisfied / reviews.length * 100).round();
            final fiveStars =
                reviews.where((review) => review.rating == 5).length;
            final fourStars =
                reviews.where((review) => review.rating == 4).length;

            final threeStars =
                reviews.where((review) => review.rating == 3).length;

            final twoStars =
                reviews.where((review) => review.rating == 2).length;

            final oneStars =
                reviews.where((review) => review.rating == 1).length;

            final fivePercentage =
                reviews.isEmpty ? 0.0 : fiveStars / reviews.length;

            final fourPercentage =
                reviews.isEmpty ? 0.0 : fourStars / reviews.length;

            final threePercentage =
                reviews.isEmpty ? 0.0 : threeStars / reviews.length;

            final twoPercentage =
                reviews.isEmpty ? 0.0 : twoStars / reviews.length;

            final onePercentage =
                reviews.isEmpty ? 3.0 : oneStars / reviews.length;

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      width: 400.w,
                      height: 390.h,
                      child: Image.network(pro.images[0], fit: BoxFit.contain),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            pro.brand.toString(),
                            style: TextStyle(color: AppColors.primary),
                          ),

                          SizedBox(width: 10.w),

                          Text(
                            pro.tags[0],
                            style: TextStyle(color: AppColors.natural),
                          ),

                           Spacer(),

                          Container(
                            width: 100.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: const Color(0x9989f5e7),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),

                                Text(
                                  "متوفر (${pro.stock} قطعة)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      pro.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      pro.sku,
                      style: TextStyle(color: AppColors.natural),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 25.h)),
                  SliverToBoxAdapter(
                    child: Container(
                      width: 350.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 84.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffDCE9FF),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                 Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                ),

                                SizedBox(width: 5.w),

                                Text(
                                  pro.rating.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 11.w),

                          Container(
                            width: 1,
                            height: 30,
                            color:  Color(0xffDCE9FF),
                          ),

                          SizedBox(width: 8.w),

                          Text(
                            "${reviews.length} تقييم حقيقي وموثق",
                            style: TextStyle(color: AppColors.natural),
                          ),

                          SizedBox(width: 11.w),

                          Container(
                            width: 1,
                            height: 30,
                            color:  Color(0xffDCE9FF),
                          ),

                          SizedBox(width: 8.w),

                          Row(
                            children: [
                              Image.asset(
                                AssetConstants.truecheak,
                                color: AppColors.tertiary,
                              ),

                              Text(
                                "أصلي 100%",
                                style: TextStyle(
                                  color: AppColors.tertiary,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 25.h)),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: 400.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color:  Color(0xffEFF4FF),
                      ),
                      child: Row(
                        children: [
                          Text(
                            pro.price.toString(),
                            style: TextStyle(
                              fontSize: 35.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "دولار",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 25.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      "الوصف :",
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 10.h)),

                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 350.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          pro.description,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 15.h)),

                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        featureBox(
                          AssetConstants.speed,
                          "شحن فوري",
                          "توصيل غداً",
                        ),
                        featureBox(
                          AssetConstants.cheak,
                          "ضمان أصلي",
                          "100% موثوق",
                        ),
                        featureBox(
                          AssetConstants.loading,
                          "استرجاع مجاني",
                          "خلال 14 يوماً",
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Text(
                          "آراء المشترين",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                         Spacer(),

                        Text(
                          "عرض الكل",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: Container(
                      width: 350.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 10.w,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  pro.rating.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 38.sp,
                                  ),
                                ),
                                RatingBarIndicator(
                                  rating: pro.rating,
                                  itemBuilder:
                                      (context, index) =>  Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                  itemCount: 5,
                                  itemSize: 24,
                                ),

                                SizedBox(height: 5.h),
                                Text("$percentage% راضون جداً"),
                              ],
                            ),
                          ),

                          Container(
                            width: 2,
                            height: 100,
                            color:  Color(0xffDCE9FF),
                          ),

                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ratingRow("5", fivePercentage),
                                  ratingRow("4", fourPercentage),
                                  ratingRow("3", threePercentage),
                                  ratingRow("2", twoPercentage),
                                  ratingRow("1", onePercentage),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: reviewCard(reviews[index]),
                        );
                      },
                      childCount: reviews.length,
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                ],
              ),
            );
          }

          return  SizedBox.shrink();
        },
      ),
    );
  }
}
Widget featureBox(String image, String title, String subtitle) {
  return Container(
    width: 110.w,
    height: 110.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: AppColors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        Text(title, style: TextStyle(color: Colors.black)),
        Text(subtitle, style: TextStyle(color: AppColors.natural)),
      ],
    ),
  );
}
Widget ratingRow(String number, double value) {
  return SizedBox(
    width: 170.w,
    child: Row(
      children: [
        Text(number),

        SizedBox(width: 8),

        Expanded(
          child: LinearProgressIndicator(
            value: value,
            minHeight: 7,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.grey.shade200,
            color: Colors.orange,
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Text("${(value * 100).round()}%"),
        ),
      ],
    ),
  );
}
Widget reviewCard(dynamic review) {
  return Container(
    width: 350.w,
    height: 125.h,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(AssetConstants.sean),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.reviewerName,
                  style: TextStyle(color: Colors.black),
                ),

                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outlined,
                      color: AppColors.tertiary,
                      size: 17,
                    ),

                    Text(
                      "مشتري موثق",
                      style: TextStyle(color: AppColors.natural),
                    ),
                  ],
                ),
              ],
            ),

             Spacer(),

            RatingBarIndicator(
              rating: review.rating.toDouble(),
              itemBuilder:
                  (context, index) =>
                      Icon(Icons.star, color: Colors.amber),
              itemCount: 5,
              itemSize: 18,
            ),

            SizedBox(width: 10.w),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            review.comment,
            style: TextStyle(color: AppColors.natural),
          ),
        ),
      ],
    ),
  );
}
