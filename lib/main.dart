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
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('Orientation $orientation');

          if (getBreakpoint(MediaQuery.of(context).size.width) ==
              WindowsBreakpoint.sm) {
            return LayoutSM();
          } else {
            return LayoutLG();
          }
        },
      ),
    );
  }
}
