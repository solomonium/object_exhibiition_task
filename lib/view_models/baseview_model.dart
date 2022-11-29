import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  String? errorMessage;

  void clearError() {
    errorMessage = null;
  }
}
