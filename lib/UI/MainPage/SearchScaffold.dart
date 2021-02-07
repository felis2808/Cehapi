import 'package:cehapi/UI/SharedWidgets/Items/ProductItemForList.dart';
import 'package:cehapi/UI/SharedWidgets/SearchAppBar.dart';
import 'package:flutter/material.dart';

class SearchScaffold extends StatefulWidget {
  @override
  _SearchScaffoldState createState() => _SearchScaffoldState();
}

class _SearchScaffoldState extends State<SearchScaffold> {
  String src =
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg';

  CustomScrollView _customScrollView(String data) {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
        delegate: new SliverChildBuilderDelegate((context, index) {
          return ProductItemForList();
        }, childCount: 10),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchAppBar(),
        body: DefaultTabController(
            length: 4,
            child: Stack(
              children: [
                Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      backgroundColor: Colors.black12,
                      title: TabBar(
                        tabs: [
                          Tab(
                            text: "Recent",
                          ),
                          Tab(text: "Services"),
                          Tab(text: "Materiel"),
                          Tab(text: "Cours")
                        ],
                      ),
                    ),
                    body: TabBarView(children: [
                      ListView(children: _buildList(20)),
                      ListView(children: _buildList(20)),
                      ListView(children: _buildList(20)),
                      ListView(children: _buildList(20)),
                    ]))
              ],
            )));
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(ProductItemForList());
    }

    return listItems;
  }
}
