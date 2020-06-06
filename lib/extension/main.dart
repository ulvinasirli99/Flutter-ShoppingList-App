import 'package:flutter/material.dart';
import 'package:fluttershoppinglist/ui/shopping_list_page.dart';

void main() => runApp(ShoppingListApp());

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingListPage(),
    );
  }
}