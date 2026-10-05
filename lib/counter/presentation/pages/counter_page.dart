import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled10/counter/presentation/manager/counter_provider.dart';
import 'package:untitled10/counter/presentation/pages/page1.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: (){

              context.read<CounterProvider>().plus();
          }, icon: Icon(Icons.add)),
          IconButton(onPressed: (){

            context.read<CounterProvider>().minus();
          }, icon: Icon(Icons.minimize)),
          IconButton(onPressed: () {

            context.read<CounterProvider>().clear();
          }, icon: Icon(Icons.delete)),
          ElevatedButton(onPressed: () {
            context.read<CounterProvider>().loadCounter();
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page1(),));
          }, child:Text('go ') ),

        ],
      ),
      body: Consumer<CounterProvider>(
        builder: (context, value, child) => Center(
            child: Text('${value.counter}'),
      ),
      ),
    );
  }
}
