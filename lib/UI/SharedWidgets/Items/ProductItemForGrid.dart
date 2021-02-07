import 'dart:async';
import 'dart:ui' as ui;

import 'package:cehapi/Models/SpecialData/SpecialData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ProductItemForList.dart';

class ProductItemForGrid extends StatelessWidget {
  ProductItemForGrid(this.src);

  String src;
  String description =
      "Utque proeliorum periti rectores primo catervas densas opponunt et fortes, deinde leves armaturas, post iaculatores ultimasque subsidiales acies, si fors adegerit, iuvaturas, ita praepositis urbanae familiae suspensae digerentibus sollicite, quos insignes faciunt virgae dexteris aptatae velut tessera data castrensi iuxta vehiculi frontem omne textrinum incedit: huic atratum coquinae iungitur ministerium, dein totum promiscue servitium cum otiosis plebeiis de vicinitate coniunctis: postrema multitudo spadonum a senibus in pueros desinens, obluridi distortaque lineamentorum conpage deformes, ut quaqua incesserit quisquam cernens mutilorum hominum agmina detestetur memoriam Samiramidis reginae illius veteris, quae teneros mares castravit omnium prima velut vim iniectans naturae, eandemque ab instituto cursu retorquens, quae inter ipsa oriundi crepundia per primigenios seminis fontes tacita quodam modo lege vias propagandae posteritatis ostendit.";

  Widget _buildSpecialData(SpecialData specialData) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                specialData.iconData,
                size: 20,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  specialData.label,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildDescription() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        description,
        style: TextStyle(color: Colors.white70),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    double _imageHeight = 300;

    Image image = Image.network(
      src,
      fit: BoxFit.fill,
    );

    Completer<ui.Image> completer = new Completer<ui.Image>();
    image.image.resolve(new ImageConfiguration()).addListener(
        ImageStreamListener(
            (ImageInfo info, bool _) => completer.complete(info.image)));

    Widget item = FutureBuilder(
      future: completer.future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          print("width : " +
              snapshot.data.width.toString() +
              ", height : " +
              snapshot.data.height.toString());
          _imageHeight =
              snapshot.data.height * screenSize / snapshot.data.width;
        }
        return Container(
          height: _imageHeight,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.white70,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () => {},
              child: Stack(fit: StackFit.expand, children: [
                image,
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 190,
                      padding: EdgeInsets.only(top: 25),
                      color: Colors.black54,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.trip_origin,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                "Title",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              )),
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Icon(Icons.favorite_border),
                              )
                            ],
                          ),
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildSpecialData(SpecialData.user),
                                  _buildSpecialData(SpecialData.location),
                                ],
                              )),
                          _buildDescription()
                        ],
                      )),
                ),
              ]),
            ),
          ),
        );
      },
    );

    return item;
  }
}
