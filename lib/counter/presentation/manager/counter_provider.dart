import 'package:flutter/cupertino.dart';
import 'package:untitled10/counter/data/data_sources/local_data_source_counter.dart';

class CounterProvider extends ChangeNotifier {
 final LocalDataSourceCounter localDataSourceCounter ;
  int counter=0 ;

  CounterProvider({required this.localDataSourceCounter});
  void plus()async{
        counter++;
        await localDataSourceCounter.saveCounter(counter);
        notifyListeners();
      }
 void minus()async{
   counter--;
   await localDataSourceCounter.saveCounter(counter);
   notifyListeners();
 }
 void clear()async{
   counter=0;
   await localDataSourceCounter.saveCounter(counter);
   notifyListeners();
 }
 void loadCounter()async{
  counter=await  localDataSourceCounter.getCounter();
 }



}