import 'package:flutter/material.dart';
import 'package:multidevice/helpers/windows_sizes.dart';
import 'package:multidevice/pages/page1.dart';
import 'package:multidevice/pages/page2.dart';
import 'package:multidevice/pages/page3.dart';
import 'package:multidevice/provider/layout_model.dart';
import 'package:provider/provider.dart';

final _items = <_Items>[
  _Items(Icons.onetwothree, 'One', const Page1()),
  _Items(Icons.onetwothree, 'Two', const Page2()),
  _Items(Icons.onetwothree, 'Three', const Page3()),
];

class _Items {
  final IconData icon;
  final String title;
  final Widget page;

  _Items(this.icon, this.title, this.page);
}

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, i) => const Divider(
          color: Colors.purple,
        ),
        itemCount: _items.length,
        itemBuilder: (context, i) => ListTile(
          leading: Icon(_items[i].icon, color: Colors.purple),
          title: Text(_items[i].title),
          trailing: Icon(_items[i].icon, color: Colors.purple),
          onTap: () {
            if (getBreakpoint(MediaQuery.of(context).size.width) ==
                WindowsBreakpoint.sm) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => _items[i].page));
            } else {
              final layoutModel =
                  Provider.of<LayoutModel>(context, listen: false);
              layoutModel.currentPage = _items[i].page;
            }
          },
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                child: const CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text(
                    'ACY',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(child: Items()),
          ],
        ),
      ),
    );
  }
}
