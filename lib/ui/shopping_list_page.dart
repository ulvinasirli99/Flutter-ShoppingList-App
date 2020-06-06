import 'package:flutter/material.dart';
import 'package:fluttershoppinglist/http/item_service.dart';
import 'package:fluttershoppinglist/model/item.dart';
import 'package:fluttershoppinglist/ui/shopping_list_history_page.dart';
import 'package:fluttershoppinglist/ui/shopping_list_item_page.dart';
import 'package:fluttershoppinglist/ui/shopping_list_main.dart';
import 'dialog/item_dialog.dart';

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  int _selectedIndex = 0;
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  ItemService _itemService;

  @override
  void initState() {
    _itemService = ItemService();
    _pageController.addListener(() {
      int currentIndex = _pageController.page.round();
      if (currentIndex != _selectedIndex) {
        _selectedIndex = currentIndex;

        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.deepOrange,
                size: 35,
              ),
              title: Text("Shopiing List",style: TextStyle(fontWeight: FontWeight.bold),)),
          BottomNavigationBarItem(
              icon: Icon(Icons.history, color: Colors.red),
              title: Text("History",style: TextStyle(fontWeight: FontWeight.bold),)),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          ShoppingListMain(),
          ShoppingListItemPage(),
          ShoppingListHistoryPage(),
        ],
      ),
    );
  }

  void _onTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
