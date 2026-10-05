import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled10/core/constants/storage_keys.dart';

class LocalDataSourceCounter {
  final SharedPreferences sharedPreferences;

  LocalDataSourceCounter({required this.sharedPreferences});
    Future<int> getCounter()async{
    return await  sharedPreferences.getInt(StorageKeys.counterKey)??0;
     }
     Future<void> saveCounter(int counter)async{
      sharedPreferences.setInt(StorageKeys.counterKey,counter );
     }
}