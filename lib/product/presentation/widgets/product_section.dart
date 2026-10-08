import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/product/presentation/pages/product_page.dart';
import 'package:untitled10/product/presentation/widgets/product_widget.dart';
import '../../../core/state/request_state.dart';
import '../manager/product_bloc.dart';
import '../pages/home_page.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
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
            delegate: SliverChildBuilderDelegate(childCount: 4, (context,
                index,) {
              final pro = state.products.data!.products[index];
              return ProductWidget(
                id: pro.id,
                image: pro.images[0],
                title: pro.title,
                brand: pro.brand!,
                price: pro.price,
                rate: pro.rating,
                onTap:
                    () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) =>
                          BlocProvider.value(
                            value: context.read<ProductBloc>(),
                            child: ProductPage(),
                          )),
                    ),
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 148.w / 290.h,
            ),
          );
        }
        else {
          return SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
