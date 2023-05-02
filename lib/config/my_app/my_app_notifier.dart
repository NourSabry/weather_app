// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
 
class MyAppNotifier with ChangeNotifier {
// notifiable .
  bool _nApp = false;

  bool get nApp => _nApp;

  void notifyApp() {
    _nApp = !_nApp;
    notifyListeners();
  }

  // dispose.
  @override
  void dispose() {
     super.dispose();
  }
}
