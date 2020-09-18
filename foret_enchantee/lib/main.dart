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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return  DefaultTabController(
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
}
