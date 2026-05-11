import 'package:flutter/material.dart';
import 'package:multidevice/drawer/drawer.dart';
import 'package:multidevice/provider/layout_model.dart';
import 'package:provider/provider.dart';

class LayoutLG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App in LG Mode'),
        // El botón de atrás solo se muestra si hay historial disponible.
        // Esto simula el comportamiento de Navigator.pop() pero para el
        // modo de dos columnas sin usar la pila de navegación de Flutter.
        leading: layoutModel.canGoBack
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Volver',
                onPressed: () => layoutModel.goBack(),
              )
            : null,
      ),
      body: Row(
        children: <Widget>[
          // Columna izquierda: menú de navegación con ancho fijo
          SizedBox(
            width: 300,
            child: Items(),
          ),
          // Separador vertical
          const VerticalDivider(width: 1, thickness: 1, color: Colors.grey),
          // Columna derecha: página actualmente seleccionada
          Expanded(child: layoutModel.currentPage),
        ],
      ),
    );
  }
}
