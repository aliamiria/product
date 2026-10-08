
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/network_provider.dart';

class NetworkPage extends StatelessWidget {
const NetworkPage({super.key});

@override
Widget build(BuildContext context) {
final isConnected =
context.watch<InternetProvider>().isConnected;

WidgetsBinding.instance.addPostFrameCallback((_) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(
isConnected
? 'أنت متصل بالإنترنت'
    : 'ما في اتصال بالإنترنت',
),
duration: const Duration(seconds: 2),
),
);
});

return Scaffold(
appBar: AppBar(
title: Text(
isConnected
? 'في إنترنت'
    : 'ما في إنترنت',
),
),

body: const Center(
child: Text(
'مراقبة الاتصال بالإنترنت',
style: TextStyle(fontSize: 20),
),
),
);
}
}

