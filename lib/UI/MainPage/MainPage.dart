import 'package:cehapi/UI/MainPage/CarpoolScaffold.dart';
import 'package:cehapi/UI/MainPage/FavoriteScaffold.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'ConversationScaffold.dart';
import 'HomeScaffold.dart';
import '../ProfilePage.dart';
import 'SearchScaffold.dart';

class MainPage extends StatefulWidget {
  const MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedItem = 2;
  List<Widget> _pages = <Widget>[
    CarpoolScaffold(),
    SearchScaffold(),
    HomeScaffold(),
    FavoriteScaffold(),
    ConversationScaffold(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedItem),
      bottomNavigationBar: _convexAppBar(),
    );
  }

  Container _floatingActionButton() {
    return Container(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/addProductPage'),
          child: Icon(Icons.add),
        ),
      );
  }

  BottomAppBar _bottomNavigationBar() {
    return BottomAppBar(
      color: Colors.transparent,
      shape: CircularNotchedRectangle(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _barItem(IconEnum.home),
            _barItem(IconEnum.search),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
            ),
            _barItem(IconEnum.favorite),
            _barItem(IconEnum.comments),
          ],
        ),
      ),
    );
  }

  ConvexAppBar _convexAppBar() {
    return ConvexAppBar(
      backgroundColor: Colors.blue,
      style: TabStyle.react,
      initialActiveIndex: _selectedItem,
      items: [
        _tabItem(IconEnum.car),
        _tabItem(IconEnum.search),
        _tabItem(IconEnum.home),
        _tabItem(IconEnum.favorite),
        _tabItem(IconEnum.comments),
      ],
      onTap:(index) => _onItemTapped(index),
    );
  }

  TabItem<IconData> _tabItem(IconEnum iconEnum) {
    return TabItem(
      icon: _iconFromIconEnum(iconEnum),
    );
  }

  IconButton _barItem(IconEnum iconEnum) {
    return IconButton(
      onPressed: () => _onItemTapped(iconEnum.index),
      iconSize: 30,
      icon: Icon(
        _iconFromIconEnum(iconEnum),
        semanticLabel: iconEnum.toString(),
        color: Colors.black26,
      ),
    );
  }

  IconData _iconFromIconEnum(IconEnum iconEnum) {
    switch (iconEnum) {
      case IconEnum.car:
        return Icons.directions_car;
        break;
      case IconEnum.search:
        return Icons.search;
        break;
        case IconEnum.home:
        return Icons.home;
        break;
      case IconEnum.comments:
        return Icons.send;
        break;
      case IconEnum.favorite:
        return Icons.favorite_border;
        break;
      default:
        return null;
    }
  }
}

enum IconEnum { car, search, home, favorite, comments }
