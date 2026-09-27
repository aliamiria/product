import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/state/request_state.dart';
import '../../../core/theme/app_colors.dart';
import '../manager/product_bloc.dart';
import '../widgets/product_widget.dart';
import 'home_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
   @override
  void initState() {
    // TODO: implement initState
     context.read<ProductBloc>().add(GetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: Image.asset(AssetConstants.logo),
        title: Text(
          'كل المنتجات',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.notification_add_outlined),
          SizedBox(width: 10),
          Icon(Icons.shopping_basket_outlined),

        ],
      ),
      body: CustomScrollView(
        slivers: [
        BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.products.status == Status.loading) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.products.status == Status.error) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.products.error)),
          );
        } else if (state.products.status == Status.success) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(childCount: state.products.data!.products.length, (
                context,
                index,
                ) {
              final pro = state.products.data!.products[index];
              return ProductWidget(
                image: pro.images[0],
                title: pro.title,
                brand:  pro.brand??pro.title,
                price: pro.price,
                rate: pro.rating,
                onTap:
                    () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ),
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 150.w / 290.h,
            ),
          );
        }
        else {
          return SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
      )
        ],
      )

    );
  }
}
