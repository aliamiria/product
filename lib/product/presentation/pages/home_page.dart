import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/constants/asset_constants.dart';
import 'package:untitled10/core/state/request_state.dart';
import 'package:untitled10/core/theme/app_colors.dart';
import 'package:untitled10/product/presentation/pages/product_page.dart';
import 'package:untitled10/product/presentation/widgets/card_section.dart';
import 'package:untitled10/product/presentation/widgets/cube_widget.dart';
import 'package:untitled10/product/presentation/widgets/important_category_section.dart';
import 'package:untitled10/product/presentation/widgets/product_section.dart';
import 'package:untitled10/product/presentation/widgets/product_widget.dart';
import 'package:untitled10/product/presentation/widgets/text_field_widget.dart';
import '../manager/product_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(GetCategoryEvent());
    context.read<ProductBloc>().add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9ff),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  child: Image.asset(AssetConstants.location),
                ),
                Text("التوصيل إلى:"),
                Text(
                  " الرياض،حي الملقا",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 35.h,
                  width: 110.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColors.tertiary.withAlpha(50),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.electric_bolt_outlined,
                        size: 20,
                        color: AppColors.tertiary,
                      ),
                      Text(
                        "توصيل سريع",
                        style: TextStyle(color: AppColors.tertiary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 10.h,
                horizontal: 10.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFieldWidget(
                    width: 295.w,
                    height: 50.h,
                    hint: "ابحث عن الماركات، العطور، الأزياء...",
                  ),
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.white),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.filter_list_rounded),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: CardSection()),
          SliverToBoxAdapter(child: ImportantCategorySection()),
    SliverToBoxAdapter(
    child:
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    "الأكثر طلباً ومبيعاً",
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
          builder: (_) => BlocProvider.value(
            value: context.read<ProductBloc>(),
            child: ProductPage(),
          ),
        ),
      );
    },
    child: Text(
    "مشاهدة الكل",
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
    ),
          ProductSection(),

        ],
      ),
    );
  }
}
