import 'package:flutter/material.dart';
import 'package:fluttershoppinglist/http/item_service.dart';
import 'package:fluttershoppinglist/model/overview.dart';

class ShoppingListMain extends StatefulWidget {
  @override
  _ShoppingListMainState createState() => _ShoppingListMainState();
}

class _ShoppingListMainState extends State<ShoppingListMain> {
  ItemService _itemService;

  @override
  void initState() {
    _itemService = ItemService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          backgroundColor: Colors.purple,
          title: Text("Ana Seyife"),
        ),
        FutureBuilder(
          future: _itemService.overview(),
          builder: (BuildContext context, AsyncSnapshot<OverView> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.purple,
              ));
            }
            return Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  new GridItem(
                      icon: Icons.shopping_basket,
                      tittle: 'Total Item',
                      total: snapshot.data.total),
                  new GridItem(
                      icon: Icons.add_shopping_cart,
                      tittle: 'Current Items',
                      total: snapshot.data.current),
                  new GridItem(
                      icon: Icons.history,
                      tittle: 'Completed Items',
                      total: snapshot.data.completed),
                  new GridItem(
                      icon: Icons.remove_shopping_cart,
                      tittle: 'Deleted Items',
                      total: snapshot.data.deleted),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class GridItem extends StatelessWidget {
  final IconData icon;
  final String tittle;
  final int total;

  const GridItem({
    Key key,
    @required this.icon,
    @required this.tittle,
    @required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              size: 64,
              color: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: Text(
                tittle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text(
              total.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
