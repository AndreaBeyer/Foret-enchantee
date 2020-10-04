import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
      "N'hésitez pas à evaluer notre application.";

  double _hauteur;
  double _largeur;
  double _rating;
  bool _rated;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _rating = 0;
    _rated = false;
    _hauteur = MediaQuery.of(context).size.height;
    _largeur = MediaQuery.of(context).size.width;
    return isIOS ? getIOS() : getAndroid();
  }

  Widget getIOS() {
    return CupertinoPageScaffold(
      child: Padding(
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(10.0, 20, 10, 20),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          color: primaryColor,
                        )
                      ],
                    ),
                    child: Form(
                        key: _formKey,
                        child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: _largeur - 35,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: _largeur / 5, right: _largeur / 5),
                                      child: TextFormField(
                                        style: TextStyle(
                                          fontFamily: "Lobster",
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Votre courriel",
                                          errorStyle: TextStyle(
                                            fontFamily: 'Lobster',
                                          ),
                                        ),
                                        validator: (value) => EmailValidator.validate(value) ? null : "Courriel invalide",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SmoothStarRating(
                                        allowHalfRating: true,
                                        onRated: (v) {
                                          _rated = true;
                                        },
                                        starCount: 5,
                                        rating: _rating,
                                        size: 40.0,
                                        isReadOnly:false,
                                        filledIconData: Icons.star,
                                        halfFilledIconData: Icons.star_half,
                                        defaultIconData: Icons.star_border,
                                        color: secondColor,
                                        borderColor: secondColor,
                                        spacing:0.0
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: _largeur,
                                    height: _hauteur / 5,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          style: TextStyle(color: Colors.black),
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Commentaire (faculatif)",
                                          ),
                                        )
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      color: secondColor,
                                      onPressed: validRating,
                                      child: new Text(
                                        "Valider",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ]
                        )
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
                      top: 10, left: 15, right: 15, bottom: 10),
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
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  padding: const EdgeInsets.fromLTRB(3,10,3,3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        color: primaryColor,
                      )
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: _largeur *0.9,
                                child: Padding(
                                  padding: EdgeInsets.only(left: _largeur / 6, right: _largeur / 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      fontFamily: "Lobster",
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                        hintText: "Votre courriel",
                                        errorStyle: TextStyle(
                                          fontFamily: 'Lobster',
                                        ),
                                    ),
                                    validator: (value) => EmailValidator.validate(value) ? null : "Courriel invalide",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmoothStarRating(
                                    allowHalfRating: true,
                                    onRated: (v) {
                                      _rated = true;
                                    },
                                    starCount: 5,
                                    rating: _rating,
                                    size: 40.0,
                                    isReadOnly:false,
                                    filledIconData: Icons.star,
                                    halfFilledIconData: Icons.star_half,
                                    defaultIconData: Icons.star_border,
                                    color: secondColor,
                                    borderColor: secondColor,
                                    spacing:0.0
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: _largeur *0.9,
                                height: _hauteur / 10,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(_largeur / 6,8,_largeur / 6,8),
                                  child: TextField(
                                    style: TextStyle(
                                      fontFamily: "Lobster",
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Commentaire (faculatif)",
                                    ),
                                  )
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  color: secondColor,
                                  onPressed: validRating,
                                  child: new Text(
                                    "Valider",
                                    style: TextStyle(
                                      fontFamily: "Lobster",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validRating() {
    if(!_rated){
      snackBar("Veuillez choisir une note");
    }
    else if (_formKey.currentState.validate()) {
      snackBar("Envoi réussi");
      _formKey.currentState.reset();
    }
  }

  void snackBar(String txt) {
    SnackBar snack = new SnackBar(
      backgroundColor: secondColor,
      content: Container(
        height: 20,
        child: new Text(
          txt,
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
      ),
      duration: new Duration(milliseconds: 400),
    );

    Scaffold.of(context).showSnackBar(snack);
  }
}
