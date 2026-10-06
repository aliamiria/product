import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceFav {
  final SharedPreferences sharedPreferences;

  LocalDataSourceFav({required this.sharedPreferences});
Future<void>  saveFavorite(List<int> ids)async{
  List<String> idss=  ids.map((e) => e.toString(),).toList();
      sharedPreferences.setStringList('fav',idss);
}
 List<int> getFavorite(){
   final x=     sharedPreferences.getStringList('fav')??[];
   return x.map((e) => int.parse(e),).toList();
 }

}