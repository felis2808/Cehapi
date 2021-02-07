import 'package:cehapi/Services/AuthService.dart';
import 'package:cehapi/UI/SharedWidgets/Items/ProductItemForList.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Username"),
          actions: [
            IconButton(
                icon: Icon(Icons.edit), color: Colors.white, onPressed: () {}),
            IconButton(
                icon: Icon(Icons.more_vert),
                color: Colors.white,
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pop(context);
                })
          ],
        ),
        body: ListView(
          children: _buildList(20),
        ));
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = List();

    listItems.add(_profileAppBar());
    for (int i = 1; i < count; i++) {
      listItems.add(ProductItemForList());
    }

    return listItems;
  }

  Widget _buildCaracteristics(String title, int nb) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Text(nb.toString()),
      ]),
    );
  }

  Widget _profileAppBar() {
    return Container(
        child: Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 30)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/loginPage'),
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        ),
                      )),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(child: Text("Name")),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Container(child: Text("Firstname"))
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      _buildCaracteristics("PUBLICATIONS", 10),
                    ],
                  ))
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15)),
        ExpansionTile(
          title: Text("Voir plus"),
          children: [Text("Nombre de publications")],
        ),
        Padding(padding: EdgeInsets.only(top: 15)),
        Text(
          "VOS PUBLICATIONS",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    ));
  }
}
