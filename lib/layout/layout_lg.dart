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
        title: Text('App in LG Mode'),
      ),
      // drawer: _MenuPrincipal(),
      body: Row(
        children: <Widget>[
          Container(
            width: 300,
            height: double.infinity,
            child: Items(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: Colors.grey,
          ),
          Expanded(child: layoutModel.currentPage)
        ],
      ),
    );
  }
}
