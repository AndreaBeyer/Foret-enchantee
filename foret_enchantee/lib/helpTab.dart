import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class HelpTab extends StatefulWidget {
  @override
  _HelpTabState createState() => _HelpTabState();
}

class _HelpTabState extends State<HelpTab> {
  String _title = "Application officielle de la Forêt Enchantée.";
  String _explication =
      "Vous y trouverez la liste des événements à voir ainsi que la possibilité de scanner directement le QR Code présent sur les stands.\n\n"
      "Nous vous souhaitons une agréable visite !\n\n"
      "N'hésitez pas à nous contacter pour toutes suggestions.";

  double _hauteur;

  double _largeur;

  @override
  Widget build(BuildContext context) {
    _hauteur = MediaQuery.of(context).size.height;
    _largeur = MediaQuery.of(context).size.width;
    return isIOS ? getIOS() : getAndroid();
  }

  Widget getIOS() {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.only(top: 33, right: 5, left: 5),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return;
          },
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 95,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "asset/Altkirch.png",
                          height: 50,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 35, left: 15, right: 15, bottom: 10),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          _explication,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Lobster",
                            fontSize: 18,
                            color: secondColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      width: _largeur / 1.8,
                      height: 45,
                      child: RaisedButton(
                          onPressed: toContactPage,
                          textColor: Colors.white,
                          color: secondColor,
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Formulaire de contact",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Lobster",
                              fontSize: 18,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getAndroid() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return;
          },
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 95,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "asset/Altkirch.png",
                          height: 50,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 5),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          _title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Lobster",
                            fontSize: 18,
                            color: secondColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 10),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          _explication,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Lobster",
                            fontSize: 18,
                            color: secondColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: _largeur / 1.8,
                      height: 45,
                      child: RaisedButton(
                          onPressed: toContactPage,
                          textColor: Colors.white,
                          color: secondColor,
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Formulaire de contact",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Lobster",
                              fontSize: 18,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toContactPage() {}
}
