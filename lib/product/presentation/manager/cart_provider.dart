import 'package:flutter/cupertino.dart';
import 'package:untitled10/product/data/data_sources/local_data_source_cart.dart';

class CartProvider extends ChangeNotifier {
  final LocalDataSourceCart localDataSourceCart;

  CartProvider({required this.localDataSourceCart});


  List<int> add= [];
  bool isAdd(int id){
    return add.contains(id);
  }
  Future<bool> toggle (int id)async {
    if (isAdd(id)) {
      return false;
    }
    add.add(id);
    notifyListeners();
    await localDataSourceCart.savedCart(add);
    return true;
  }
  Future<void> remove(int id) async {
    add.remove(id);
    notifyListeners();
    await localDataSourceCart.savedCart(add);
  }
  void getAdd() {
      add = localDataSourceCart.getCart();
      notifyListeners();
    }
}
