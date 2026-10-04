import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled10/core/constants/storage_keys.dart';

class LocalDataSourceProduct {
  final SharedPreferences sharedPreferences;

  LocalDataSourceProduct({required this.sharedPreferences});
  Future<void>saveCounter(int co)async{
    try {
      await sharedPreferences.setInt(StorageKeys.counterKey, co);
    } on Exception catch (e) {
    throw Exception();
    }
  }
  int getCounter(){
  return  sharedPreferences.getInt(StorageKeys.counterKey)??0;
  }
}