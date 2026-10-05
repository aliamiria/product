import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled10/counter/data/data_sources/local_data_source_counter.dart';
import 'package:untitled10/counter/presentation/manager/counter_provider.dart';
import 'package:untitled10/product/data/data_sources/local_data_source_product.dart';
import 'package:untitled10/product/data/data_sources/remote_data_source_product.dart';
import 'package:untitled10/product/data/repositories/product_repo.dart';
import 'package:untitled10/product/presentation/manager/product_bloc.dart';

final s1 = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  s1.registerSingleton<SharedPreferences>(sharedPreferences);
  s1.registerLazySingleton<RemoteDataSourceProduct>(
    () => RemoteDataSourceProduct(),
  );
  s1.registerLazySingleton<LocalDataSourceProduct>(
    () => LocalDataSourceProduct(sharedPreferences: s1<SharedPreferences>()),
  );
  s1.registerLazySingleton(
    () => ProductRepo(
      s1<LocalDataSourceProduct>(),
      remoteDataSourceProduct: s1<RemoteDataSourceProduct>(),
    ),
  );
  s1.registerFactory<ProductBloc>(
    () => ProductBloc(productRepo: s1<ProductRepo>()),
  );
  s1.registerLazySingleton<LocalDataSourceCounter>(
    () => LocalDataSourceCounter(sharedPreferences: s1<SharedPreferences>()),
  );
  s1.registerFactory<CounterProvider>(
    () => CounterProvider(localDataSourceCounter: s1<LocalDataSourceCounter>()),
  );
}
