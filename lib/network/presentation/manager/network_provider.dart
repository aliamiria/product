import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetProvider extends ChangeNotifier {
  bool _isConnected = true;

  bool get isConnected => _isConnected;

  StreamSubscription<InternetStatus>? _subscription;

  InternetProvider() {
    _checkInternet();
    _listenToInternet();
  }

  Future<void> _checkInternet() async {
    final status = await InternetConnection().internetStatus;

    _isConnected = status == InternetStatus.connected;

    notifyListeners();
  }

  void _listenToInternet() {
    _subscription = InternetConnection().onStatusChange.listen((status) {
      _isConnected = status == InternetStatus.connected;

      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}