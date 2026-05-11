import 'package:flutter/material.dart';
import 'package:multidevice/helpers/windows_sizes.dart';
import 'package:multidevice/pages/page1.dart';
import 'package:multidevice/pages/page2.dart';
import 'package:multidevice/pages/page3.dart';
import 'package:multidevice/provider/layout_model.dart';
import 'package:provider/provider.dart';

final _items = <_Items>[
  _Items(Icons.looks_one_outlined, 'One', const Page1()),
  _Items(Icons.looks_two_outlined, 'Two', const Page2()),
  _Items(Icons.looks_3_outlined, 'Three', const Page3()),
];

class _Items {
  final IconData icon;
  final String title;
  final Widget page;
  _Items(this.icon, this.title, this.page);
}

/// Widget de menú de navegación.
/// Funciona tanto dentro del Drawer (modo SM) como en la columna lateral
/// del layout de dos columnas (modo LG).
/// El parámetro [selectedIndex] indica qué ítem está activo para resaltarlo.
class Items extends StatefulWidget {
  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  // Índice del ítem actualmente seleccionado; -1 = ninguno
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => const Divider(color: Colors.purple),
      itemCount: _items.length,
      itemBuilder: (context, i) {
        final isSelected = _selectedIndex == i;
        return ListTile(
          // Fondo diferenciado cuando el ítem está seleccionado
          tileColor: isSelected ? Colors.purple.withOpacity(0.12) : null,
          shape: isSelected
              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              : null,
          leading: Icon(
            _items[i].icon,
            color: isSelected ? Colors.purple : Colors.grey,
          ),
          title: Text(
            _items[i].title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.purple : null,
            ),
          ),
          trailing: isSelected
              ? const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.purple)
              : null,
          onTap: () {
            setState(() => _selectedIndex = i);

            if (getBreakpoint(MediaQuery.of(context).size.width) ==
                WindowsBreakpoint.sm) {
              // En pantalla pequeña: navegación tradicional con stack
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => _items[i].page));
            } else {
              // En pantalla grande: reemplazamos el contenido de la columna derecha
              final layoutModel =
                  Provider.of<LayoutModel>(context, listen: false);
              layoutModel.currentPage = _items[i].page;
            }
          },
        );
      },
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.purple.shade50,
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
    );
  }
}
