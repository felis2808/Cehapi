import 'package:cehapi/UI/SharedWidgets/Items/ProductItemForList.dart';
import 'package:cehapi/UI/SharedWidgets/SearchAppBar.dart';
import 'package:flutter/material.dart';

class FavoriteScaffold extends StatefulWidget {
  @override
  _FavoriteScaffoldState createState() => _FavoriteScaffoldState();
}

class _FavoriteScaffoldState extends State<FavoriteScaffold> {
  String src =
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchContainer(),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profilePage');
            },
          )
        ],
      ),
      body: Scaffold(body: ListView(children: _buildList(20))),
    );
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(ProductItemForList());
    }

    return listItems;
  }
}
