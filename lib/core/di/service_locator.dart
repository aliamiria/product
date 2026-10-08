import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled10/network/presentation/manager/network_provider.dart';
import 'package:untitled10/product/data/data_sources/local_data_source_cart.dart';
import 'package:untitled10/product/data/data_sources/local_data_source_product.dart';
import 'package:untitled10/product/data/data_sources/remote_data_source_product.dart';
import 'package:untitled10/product/data/repositories/product_repo.dart';
import 'package:untitled10/product/presentation/manager/cart_provider.dart';
import 'package:untitled10/product/presentation/manager/product_bloc.dart';

import '../../product/data/data_sources/local_data_source_fav.dart';
import '../../product/presentation/manager/favorite_provider.dart';

final s1=GetIt.instance;
Future<void> setupServiceLocator()async{
  final sharedPreferences = await SharedPreferences.getInstance();
  s1.registerSingleton<SharedPreferences>(sharedPreferences);
  s1.registerLazySingleton<RemoteDataSourceProduct>(() => RemoteDataSourceProduct(),);
  s1.registerLazySingleton<LocalDataSourceProduct>(() => LocalDataSourceProduct(sharedPreferences: sharedPreferences),);
  s1.registerLazySingleton(() => ProductRepo(s1<LocalDataSourceProduct>(), remoteDataSourceProduct: s1<RemoteDataSourceProduct>()),);
  s1.registerFactory<ProductBloc>(() => ProductBloc(productRepo: s1<ProductRepo>()),);
  s1.registerLazySingleton<LocalDataSourceFav>(() =>LocalDataSourceFav(sharedPreferences: s1<SharedPreferences>()) ,);
  s1.registerFactory<FavoriteProvider>(() =>FavoriteProvider(localDataSourceFav: s1<LocalDataSourceFav>()) ,);
  s1.registerLazySingleton<LocalDataSourceCart>(() => LocalDataSourceCart(sharedPreferences: s1<SharedPreferences>()),);
  s1.registerFactory<CartProvider>(() => CartProvider(localDataSourceCart: s1<LocalDataSourceCart>()),);
  s1.registerFactory<InternetProvider>(() => InternetProvider(),);

}