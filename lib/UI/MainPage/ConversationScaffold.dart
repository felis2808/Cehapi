import 'package:cehapi/UI/SharedWidgets/SearchAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationScaffold extends StatefulWidget {
  @override
  _ConversationScaffoldState createState() => _ConversationScaffoldState();
}

class _ConversationScaffoldState extends State<ConversationScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: SearchContainer()),
        body: ListView(
          children: _buildList(20),
        ));
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(_productItem());
    }

    return listItems;
  }

  Widget _productItem() {
    return Card(
      child: InkWell(
        onTap: () => {},
        child: Container(
          alignment: Alignment.centerLeft,
          height: 80,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      ),
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 6,
                            child: Text(
                              "User",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                            flex: 4,
                            child: Text(
                              "Last message",
                              style: TextStyle(fontSize: 12),
                            ))
                      ]),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
      ),
    );
  }
}
