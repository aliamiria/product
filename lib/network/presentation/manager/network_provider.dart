import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkProvider extends ChangeNotifier {
    NetworkProvider(){
      checkInternet();
      listenNetwork();
    }
   bool isConnected =true;
    StreamSubscription<InternetStatus>? subscription ;
   Future<void>  checkInternet()async{
         isConnected=await InternetConnection().hasInternetAccess;
         notifyListeners();
     }
     void listenNetwork(){
     subscription= InternetConnection().onStatusChange.listen((event) {
         isConnected= event==InternetStatus.connected;
         notifyListeners();
     },);

     }

}