import 'package:flutter/material.dart';

class SessionProvider extends ChangeNotifier {
  String _name = 'undefined michi 😼';

  String get name => _name;

  set name(String newName) {
    _name = newName;
    notifyListeners();
  }
}
