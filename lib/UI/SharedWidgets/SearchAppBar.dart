import 'package:cehapi/Utils/CustomSearchDelegate.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Size _preferredSize;

  SearchAppBar() : _preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => _preferredSize;
}

class SearchContainer extends StatelessWidget {
  const SearchContainer();

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15)),
        child: InkWell(
          onTap: () =>
              {showSearch(context: context, delegate: CustomSearchDelegate())},
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  Expanded(
                      child: Text('Rechercher ...', textAlign: TextAlign.start))
                ]),
          ),
        ));
  }
}
