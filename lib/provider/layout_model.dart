import 'package:flutter/material.dart';
import 'package:multidevice/pages/page1.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = Page1();

  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => this._currentPage;
}
