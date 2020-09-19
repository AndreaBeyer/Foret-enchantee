import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    largeur = MediaQuery.of(context).size.width;
    hauteur = MediaQuery.of(context).size.height;
    return Scaffold(
      body: HomeTabState(),
    );
  }
}

class HomeTabState extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTabState>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: hauteur - 75,
                width: largeur,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      )
                    ]
                ),
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 3),
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
                      width: largeur,
                      height: hauteur-150,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Bienvenue à la forêt enchantée",
                                      style: new TextStyle(
                                        color: secondColor,
                                        fontSize: 24,
                                        fontFamily: "Lobster",
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 8),
                                child: Image.asset(
                                  "asset/enchantee.jpg",
                                  width: largeur,
                                  height: hauteur/4,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 8),
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    Text(
                                      "La Forêt Enchantée"
                                          " d’Altkirch illustre chaque année une dizaine de contes et légendes. \n\nAnimaux de la forêt, personnages mystérieux et décors magiques s’installent au centre-ville "
                                          "pour vous transporter vers un monde fantastique.\n\nLa période de Noël se veut particulière à Altkirch, pas de marché de Noël traditionnel mais une "
                                          "mise en scène originale transformant tout le centre-ville en une forêt magique.\n\nÀ cette occasion, découvrez de nombreuses animations :\n"
                                          " spectacles de rue et déambulations, animations à la patinoire en plein air, Village des artisans, etc…\n\n",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Lobster",
                                        fontSize: 16,
                                        color: secondColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}