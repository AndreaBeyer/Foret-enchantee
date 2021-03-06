import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foret_enchantee/qr_code_ico_icons.dart';

import 'Conte.dart';
import 'Video Tab.dart';
import 'main.dart';

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
  String barcode;

  @override
  void initState() {
    super.initState();
    getList();
    barcode = '';
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return isIOS ? getIOS() : getAndroid();
  }

  Widget getAndroid(){
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: tmp
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  child: FittedBox(
                    child: new FloatingActionButton(
                      heroTag: "btnQR",
                      onPressed: () {
                        scan();
                        getList();
                      },
                      elevation: 8,
                      backgroundColor: Colors.white,
                      child: new Icon(
                        Qr_code_ico.qrcode,
                        color: secondColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60.0,
                  width: 60.0,
                  child: FittedBox(
                    child: new FloatingActionButton(
                      heroTag: "btnRS",
                      onPressed: () {
                        restoreLastHistory();
                        getList();
                      },
                      elevation: 8,
                      backgroundColor: Colors.white,
                      child: new Icon(
                        Icons.refresh,
                        color: secondColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getIOS(){
    return CupertinoPageScaffold(
      backgroundColor: primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 50),
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 150,
                child: tmp
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    child: FittedBox(
                      child: new FloatingActionButton(
                        heroTag: "btnQR",
                        onPressed: () {
                          scan();
                          getList();
                        },
                        elevation: 8,
                        backgroundColor: Colors.white,
                        child: new Icon(
                          FontAwesomeIcons.qrcode,
                          color: secondColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 60.0,
                    child: FittedBox(
                      child: new FloatingActionButton(
                        heroTag: "btnRS",
                        onPressed: () {
                          restoreLastHistory();
                          getList();
                        },
                        elevation: 8,
                        backgroundColor: Colors.white,
                        child: new Icon(
                          FontAwesomeIcons.arrowAltCircleDown,
                          color: secondColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getList() {
    setState(() {
      tmp = ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: (5), right: (5), top: 2, bottom: 2),
          itemCount: listeContes.getLengthActual(),
          itemBuilder: (context, int index) {
            return getContainer(listeContes.getActualAt(index));
          });
    });
  }

  void restoreLastHistory() {
    if (!listeContes.historicIsEmpty()) {
      setState(() {
        listeContes.addActual(listeContes.getLastHistory());
        listeContes.removeLastHistory();
      });
      snackBar("Restauration réussie");
    }
    else{
      snackBar("La liste est déja pleine");
    }

  }

  Future scan() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() => this.barcode = result.rawContent);
      //int id = 0;
      //id = int.tryParse(barcode);
      print("code barre :" + barcode);
      if (barcode != '') {
        Conte tmp = listeContes.searchDefaultByID(barcode);
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
              builder: (context) => VideoTab(tmp.video, tmp.desc)),
        );
      }
    } catch (e) {
      setState(() => this.barcode = '');
    }
  }

  Dismissible getContainer(Conte conte) {
    return new Dismissible(
      key: UniqueKey(),
      child: Card(
        child: GestureDetector(
          child: Column(
            children: [
              Container(
                height: 80,
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width / 15.0),
                    right: (MediaQuery.of(context).size.width / 15.0),
                    top: 0,
                    bottom: 0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Image.asset(
                            conte.path,
                            width: 50,
                          ),
                        ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text(
                          conte.nom,
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
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                  builder: (context) => VideoTab(conte.video, conte.desc)),
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
          listeContes.removeActual(conte);
          listeContes.addHistoric(conte);
        });
        getList();
        snackBar("Marqué comme vu");
      },
    );
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
