import 'package:flutter/cupertino.dart';
import 'package:untitled10/product/data/data_sources/local_data_source_fav.dart';

class FavoriteProvider extends ChangeNotifier {
  final LocalDataSourceFav localDataSourceFav;

  List<int> fav = [];

  FavoriteProvider({required this.localDataSourceFav});

  bool isFav(int id) {

    return fav.contains(id);
  }

  Future<void> toggleFav(int id) async {
    if (isFav(id)) {
      fav.remove(id);
    } else {
      fav.add(id);
    }
    await localDataSourceFav.saveFavorite(fav);
    getFavorites();
    notifyListeners();
  }

  void getFavorites() {
    fav = localDataSourceFav.getFavorite();
    notifyListeners();
  }
}
