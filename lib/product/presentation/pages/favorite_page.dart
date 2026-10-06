import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/product/presentation/manager/favorite_provider.dart';
import 'package:untitled10/product/presentation/pages/product%20_details_page.dart';
import 'package:untitled10/product/presentation/widgets/product_widget.dart';
import '../manager/product_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {

                     final ids = context.watch<FavoriteProvider>().fav;
                     final pro = state.products.data;
                     final x =pro!.products.where((element) => ids.contains(element.id)).toList();
                return SliverGrid(
                    delegate: SliverChildBuilderDelegate(childCount:x.length ,(context, index) {
                      return ProductWidget(
                        id: x[index].id,
                        image:x[index].images[0],
                        title: x[index].title,
                        brand: x[index].brand ?? 'not found',
                        price: x[index].price,
                        rate: x[index].rating,
                        onTap: () {
                          final productBloc = context.read<ProductBloc>();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) =>
                                  BlocProvider.value(
                                    value: productBloc,
                                    child: ProductDetailsPage(
                                      id: pro.products[index].id,
                                    ),
                                  ),
                            ),
                          );
                        },
                      );
                    },),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 150.w / 290.h,
                        crossAxisCount: 2));
              },
            )
          ],
        )
    );
  }
}
