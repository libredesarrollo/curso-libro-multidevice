import 'package:flutter/material.dart';
import 'package:multidevice/drawer/drawer.dart';
import 'package:multidevice/pages/page1.dart';

import 'package:provider/provider.dart';

class LayoutSM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App in SM Mode'),
        ),
        drawer: MyDrawer(),
        // body: Items()
        body: Page1());
  }
}
