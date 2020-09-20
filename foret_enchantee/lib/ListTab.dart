import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Conte.dart';
import 'Video Tab.dart';
import 'main.dart';
import 'dart:convert' as convert;

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
final String path = "foret_enchantee/JSON/contes.JSON";

class ListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(bottom: 0, right: 5),
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

