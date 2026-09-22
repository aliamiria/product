import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: PopupMenuButton(offset: Offset(10, 20),child: Text("vbn"),itemBuilder: (context) {
        return [

          PopupMenuItem(child: Text("data"),value: "data",),
          PopupMenuItem(child: Text("dat"),value: "dat",),
          PopupMenuItem(child: Text("da"),value: "da",),

        ];
      },),),
    );
  }
}
