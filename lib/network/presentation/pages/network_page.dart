import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled10/network/presentation/manager/network_provider.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<NetworkProvider>(

            builder:(context, value, child) {
              if (!value.isConnected) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No Internet ❌'),
                  ),
                );
              }
              return Center(
                child: Text('${value.isConnected}'),
            );
            },
          )
        ],
      ),
    );

  }
}
