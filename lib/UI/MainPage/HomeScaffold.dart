import 'package:cehapi/UI/SharedWidgets/Items/ProductItemForGrid.dart';
import 'package:cehapi/UI/SharedWidgets/SearchAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScaffold extends StatefulWidget {
  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  String src1 =
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg';

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    setState(() {
      print(_scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Evenements",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(8.0))),
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
        body: Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            title: SearchContainer(),
            actions: [IconButton(icon: Icon(Icons.tune), onPressed: null)],
          ),
          body: ListView.builder(
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return ProductItemForGrid(src1);
            },
            itemCount: 5,
          ),
        ));
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(ProductItemForGrid(src1));
    }

    return listItems;
  }
}
