import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled10/core/theme/app_theme.dart';
import 'package:untitled10/product/data/data_sources/local_data_source_product.dart';
import 'package:untitled10/product/data/data_sources/remote_data_source_product.dart';
import 'package:untitled10/product/data/repositories/product_repo.dart';
import 'package:untitled10/product/presentation/manager/product_bloc.dart';
import 'package:untitled10/product/presentation/pages/counter_page.dart';
import 'package:untitled10/product/presentation/pages/main_page.dart';
import 'package:untitled10/product/presentation/pages/product_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translation',
      startLocale: Locale('ar'),
      saveLocale: true,
      fallbackLocale: Locale('ar'),
      useOnlyLangCode: true,
      supportedLocales: [Locale('ar'), Locale('en')],
      child: MyApp(sharedPreferences: sharedPreferences,),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sharedPreferences});
   final SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 884),
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context)  {
                        return ProductBloc(
                        productRepo: ProductRepo(
                          LocalDataSourceProduct(
                            sharedPreferences:
                                 sharedPreferences,
                          ),
                          remoteDataSourceProduct: RemoteDataSourceProduct(),
                        ),
                      );
                      },
                ),
              ],
              child: CounterPage(),
            ),
          ),
    );
  }
}
