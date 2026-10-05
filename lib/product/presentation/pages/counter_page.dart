import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/product/presentation/manager/product_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(GetCounterEvent());
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         IconButton(onPressed: (){
                  setState(() {
                     counter++;

                  });
               
         }, icon: Icon(Icons.add)),
          IconButton(onPressed: (){
                   setState(() {
                     counter--;
                    
                   });
         }, icon: Icon(Icons.minimize)),
          IconButton(onPressed: () {
                  setState(() {
                     counter=0;
                   
                  });
         }, icon: Icon(Icons.delete)),
          ElevatedButton(onPressed: () {
            context.read<ProductBloc>().add(SaveCounterEvent(counter: counter));
          }, child: Text('data'))
        ],
      ),
      body: Center(
        child: Text('${context.watch<ProductBloc>().state.counter.data}'),
      ),
    );
  }
}
