import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foret_enchantee/HomeTab.dart';

import 'Conte.dart';
import 'ListTab.dart';

const primaryColor = const Color.fromRGBO(231, 224, 218, 1);
const secondColor = const Color.fromRGBO(193, 133, 76, 1);

bool first = true;

double largeur;
double hauteur;

List<Conte> listeContes = new List<Conte>();
List<Conte> listeDefaut = new List<Conte>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forêt Enchantée',
      theme: ThemeData(
        primaryColor: secondColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Forêt Enchantée'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    if (listeDefaut.isEmpty) {
      recuperer(context);
    }
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0), // here the desired height
              child: AppBar(
                bottom: TabBar(
                  indicatorColor: secondColor,
                  tabs: [
                    Tab(icon: Icon(Icons.home)),
                    Tab(icon: Icon(Icons.list)),
                  ],
                ),
              )),
          body: TabBarView(
            children: [
              HomeTab(),
              ListTab(),
            ],
          ),
        ));
  }

  Future<void> recuperer(BuildContext context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString("JSON/contes.JSON");
    var parsedJson = json.decode(data.toString());

    for (int i = 0; i < parsedJson.elementAt(0).length; i++) {
      Conte conte = new Conte(
          parsedJson.elementAt(i)['nom'],
          parsedJson.elementAt(i)['path'],
          parsedJson.elementAt(i)['video'],
          parsedJson.elementAt(i)['desc']);
      listeDefaut.add(conte);
      listeContes.add(conte);
      print(conte.nom);
    }
  }
}
