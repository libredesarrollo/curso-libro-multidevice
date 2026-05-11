import 'package:flutter/material.dart';
import 'package:multidevice/helpers/windows_sizes.dart';
import 'package:multidevice/layout/layout_lg.dart';
import 'package:multidevice/layout/layout_sm.dart';
import 'package:multidevice/provider/layout_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (_) => LayoutModel(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Devices App',
      // LayoutBuilder reacciona al tamaño real disponible del widget,
      // no a la orientación del dispositivo; esto lo hace más preciso que
      // OrientationBuilder cuando la app corre en escritorio o web.
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (getBreakpoint(constraints.maxWidth) == WindowsBreakpoint.sm) {
            return LayoutSM();
          } else {
            return LayoutLG();
          }
        },
      ),
    );
  }
}
