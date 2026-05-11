import 'package:flutter/material.dart';
import 'package:multidevice/pages/page1.dart';

class LayoutModel with ChangeNotifier {
  // Historial de páginas visitadas en el modo de doble columna.
  // Permite implementar la funcionalidad de "volver atrás" sin usar Navigator.
  final List<Widget> _history = [];

  Widget _currentPage = Page1();

  /// Cambia la página actual y guarda la anterior en el historial.
  set currentPage(Widget page) {
    _history.add(_currentPage); // guardamos la página antes de salir
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;

  /// Retorna true si existe al menos una página anterior en el historial.
  bool get canGoBack => _history.isNotEmpty;

  /// Retrocede a la página anterior del historial.
  void goBack() {
    if (_history.isNotEmpty) {
      _currentPage = _history.removeLast();
      notifyListeners();
    }
  }
}
