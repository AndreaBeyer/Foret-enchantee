import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Conte.dart';
import 'Video Tab.dart';
import 'main.dart';
import 'package:permission_handler/permission_handler.dart';

class ListTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    if (first) {
      listeDefaut
          .add(new Conte("La forêt enchantée", "asset/foret.png", "flutter_assets/foret.mp4", "Il était une fois une forêt extraordinaire, celle qui peupla nos rêves d’enfant et qui hante encore nos rêves d’adulte. \n\nC’est la forêt magique des contes. Si l’on se réfère aux sources premières de cette littérature originelle, \n\nil n’est point étonnant que l’homme ait cherché à apprivoiser son environnement par la magie du verbe et qu’il ait souvent situé ses premiers récits oraux dans un cadre qui devait susciter à la fois fascination et crainte."));
      listeDefaut
          .add(new Conte("La sorcière","asset/sorciere.png", "flutter_assets/sorciere.mp4", "Il était une fois une terrible sorcière. Elle était non seulement affreusement moche mais aussi terriblement méchante. \n\n"
          "Elle vivait cachée au fond des bois, car elle avait un grand nez crochu et des ongles en forme de griffes. Les gens en la voyant, devinaient que c'était une sorcière.\n\n"
          "Mais le soir d'Halloween, comme tout le monde était déguisé, elle en profitait pour venir en ville.",));
      listeDefaut
          .add(new Conte("La licorne magique", "asset/licorne.png", "flutter_assets/licorne.mp4", "Il était une fois une jolie licorne du nom de Lucie qui avait un mignon petit frère.\n\nIl était gentil et elle l’adorait. Mais aujourd’hui, Lucie aurait bien aimé avoir sa maman pour elle toute seule car… c’était son anniversaire.Oui, mais voilà.Plume, son petit frère, était malade aujourd’hui. Pleins de petits points rouges avaient poussé sur son corps.\n\n Et Maman n’avait d’yeux que pour lui un peu triste, Lucie partit pour l’école."));
      listeDefaut
          .add(new Conte("La montagne mystérieuse", "asset/montagne.png", "flutter_assets/montagne.mp4", "Il était une fois, une petite fille très malheureuse, car chez elle ça ne pouvait être elle même.\n\nSinon, Elsa serait immédiatement considérée comme une sorcière aux yeux des habitants du royaume.\n\nElle possède un incroyable secret :  elle possède le puissant pouvoir de contrôler la neige et la glace"));

      for(int i = 0; i < listeDefaut.length; i++){
        listeContes.add(listeDefaut.elementAt(i));
      }
      first = false;
    }
    return Scaffold(
      body: MyListPage(title: 'Liste de contes'),
    );
  }
}


class MyListPage extends StatefulWidget {
  MyListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {

  Widget tmp;

  @override
  void initState() {
    super.initState();
    getList();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: tmp,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 15),
        child: Container(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: new FloatingActionButton(
              onPressed: () {
                restoreList();
                //navigateToSubPage(context);
              },
              elevation: 8,
              backgroundColor: secondColor,
              tooltip: 'Refresh',
              child: new Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getList(){
    tmp = ListView.builder(
        padding: EdgeInsets.only(left: (5), right: (5), top: 2, bottom: 2),
        itemCount: listeContes.length,
        itemBuilder: (context, int index) {
          return getContainer(listeContes[index]);
        });
  }

  void restoreList(){
    setState(() {
      listeContes = new List();
      for(int i = 0; i < listeDefaut.length; i++){
        listeContes.add(listeDefaut.elementAt(i));
      }
      tmp = ListView.builder(
          padding: EdgeInsets.only(left: (5), right: (5), top: 2, bottom: 2),
          itemCount: listeDefaut.length,
          itemBuilder: (context, int index) {
            return getContainer(listeDefaut[index]);
          });
      snackBar("Restauration réussie");
    });
  }

  Dismissible getContainer(Conte pers) {
    return new Dismissible(
      key: UniqueKey(),
      child: Card(
        child: GestureDetector(
          child: Column(
            children: [
              Container(
                height: 80,
                padding: EdgeInsets.only(
                    left: (largeur / 15.0),
                    right: (largeur / 15.0),
                    top: 0,
                    bottom: 0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Image.asset(
                            pers.path,
                            width: 50,
                          ),
                        ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text(
                          pers.nom,
                          style: new TextStyle(
                            fontSize: 23,
                            color: secondColor,
                            fontFamily: 'Lobster',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoTab(pers.video, pers.desc)),
            );
          },
        ),
      ),
      background: new Container(
        color: Colors.green,
        margin: EdgeInsets.all(5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                trailing: new Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        setState(() {
          suppressPersonne(pers);
        });
      },
    );
  }

  void suppressPersonne(Conte p) {
    setState(() {
      listeContes.remove(p);
      snackBar(
          "Marqué comme vu"
      );
    });
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

