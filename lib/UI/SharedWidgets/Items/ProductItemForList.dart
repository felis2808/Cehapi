import 'package:cehapi/Models/SpecialData/SpecialData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductItemForList extends StatelessWidget {
  TextStyle titleTS = TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () => {},
        child: Container(
          alignment: Alignment.center,
          height: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.black,
                    child: Stack(children: [
                      Container(
                        height: 150,
                        alignment: Alignment.center,
                        child: Image(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8, bottom: 5),
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              "Title",
                              style: titleTS,
                            )),
                        _buildSpecialData(SpecialData.user),
                        _buildSpecialData(SpecialData.type),
                        _buildSpecialData(SpecialData.location)
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialData(SpecialData specialData) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal : 12.0),
          child: Row(
            children: [
              Icon(specialData.iconData, size: 20,),
              Expanded(
                flex: 5,
                child: Text(
                  specialData.label,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}


