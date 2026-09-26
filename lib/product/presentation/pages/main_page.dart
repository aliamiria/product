import 'package:flutter/material.dart';
import 'package:untitled10/core/constants/asset_constants.dart';
import 'package:untitled10/core/theme/app_colors.dart';
import 'package:untitled10/product/presentation/pages/account_page.dart';
import 'package:untitled10/product/presentation/pages/basket_page.dart';
import 'package:untitled10/product/presentation/pages/category_page.dart';
import 'package:untitled10/product/presentation/pages/favorite_page.dart';
import 'package:untitled10/product/presentation/pages/home_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "الرئيسية"),
    BottomNavigationBarItem(
      icon: Icon(Icons.category_outlined),
      label: "الأقسام",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border_outlined),
      label: "المفضلة",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket_outlined),
      label: "سلتي",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "حسابي"),
  ];
  List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    FavoritePage(),
    BasketPage(),
    AccountPage(),
  ];
  int currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF8F9FF),
        actionsPadding: EdgeInsets.all(20),
        actionsIconTheme: IconThemeData(),
        leading: Image.asset(AssetConstants.logo),
        title: Text(
          'سوقنا',
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: items,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.natural,
        selectedItemColor: AppColors.primary,
        onTap: (value) => changeIndex(value),
      ),
      body: pages[currentIndex],
    );
  }
}
