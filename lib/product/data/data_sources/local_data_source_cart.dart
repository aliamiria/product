import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceCart {
  final SharedPreferences sharedPreferences;

  LocalDataSourceCart({required this.sharedPreferences});
 Future<void> savedCart(List<int> ids)async{
    final idss = await ids.map((e) => e.toString(),).toList();
    sharedPreferences.setStringList("cart", idss);
  }
  List<int> getCart(){
   final cart=sharedPreferences.getStringList("cart")??[];
   return cart.map((e) => int.parse(e),).toList();
  }
}