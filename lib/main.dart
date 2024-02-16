import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// void main() => runApp(
//   ChangeNotifierProvider(
//     create: (_) => new LayoutModel(),
//     child: ChangeNotifierProvider(
//       create: (_) => new ThemeChanger( 2 ),
//       child: MyApp()
//     ),
//   )
// );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('Orientation $orientation');

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
