import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foret_enchantee/HomeTab.dart';
import 'package:foret_enchantee/SplashScreen.dart';
import 'package:foret_enchantee/listeContes.dart';

import 'Conte.dart';
import 'ListTab.dart';
import 'helpTab.dart';

const primaryColor = const Color.fromRGBO(231, 224, 218, 1);
const secondColor = const Color.fromRGBO(193, 133, 76, 1);

final bool isIOS = false; //Platform.isIOS;

final ListeContes listeContes = new ListeContes();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return CupertinoApp(
        title: 'Forêt Enchantée',
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      );
    } else {
      return MaterialApp(
        title: 'Forêt Enchantée',
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      );
    }
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
    if (listeContes.defaultIsEmpty()) {
      recuperer(context);
    }
    return isIOS ? getIOS() : getAndroid();
  }

  Widget getAndroid() {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0), // here the desired height
              child: AppBar(
                bottom: TabBar(
                  indicatorColor: secondColor,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.home,
                        color: secondColor,
                      ),
                    ),
                    Tab(
                        icon: Icon(
                      Icons.list,
                      color: secondColor,
                    )),
                    Tab(
                        icon: Icon(
                      Icons.help_center,
                      color: secondColor,
                    )),
                  ],
                ),
              )),
          body: TabBarView(
            children: [
              HomeTab(),
              ListTab(),
              HelpTab(),
            ],
          ),
        ));
  }

  Widget getIOS() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
              activeIcon: Icon(
                CupertinoIcons.home,
                color: secondColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              activeIcon: Icon(
                Icons.list,
                color: secondColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.info,
              ),
              activeIcon: Icon(
                CupertinoIcons.info,
                color: secondColor,
              ),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          CupertinoTabView returnValue;
          switch (index) {
            case 0:
              returnValue = CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: HomeTab(),
                );
              });
              break;
            case 1:
              returnValue = CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: ListTab(),
                );
              });
              break;
            case 2:
              returnValue = CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: HelpTab(),
                );
              });
              break;
          }
          return returnValue;
        },
      ),
    );
  }

  Future<void> recuperer(BuildContext context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString("JSON/contes.JSON");
    var parsedJson = json.decode(data.toString());

    for (int i = 0; i < parsedJson.elementAt(i).length; i++) {
      Conte conte = new Conte(
          parsedJson.elementAt(i)['id'],
          parsedJson.elementAt(i)['nom'],
          parsedJson.elementAt(i)['path'],
          parsedJson.elementAt(i)['video'],
          parsedJson.elementAt(i)['desc']);
      listeContes.addActual(conte);
      listeContes.addDefault(conte);
    }
  }
}
