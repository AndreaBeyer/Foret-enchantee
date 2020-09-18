import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:video_player/video_player.dart';

import 'VideoPlayerScreen.dart';
import 'main.dart';

class VideoTab extends StatefulWidget {

  VideoTab(this.path, this.desc) : super();

  final String desc;
  final String path;

  @override
  _VideoTabState createState() => _VideoTabState(path, desc);
}

class _VideoTabState extends State<VideoTab> {
  _VideoTabState(this.path, this.desc) : super();

  VideoPlayerController controller;

  final String desc;
  final String path;

  List<Map<bool, IconData>> _icon = [
    {
      true: Icons.pause,
      false: Icons.play_arrow,
    }
  ];

  bool enCours = false;
  bool enPause = false;
  bool enArret = true;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
    controller = VideoPlayerController.asset(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: new BoxDecoration(
              color: secondColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            height: 5,
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: VideoPlayerScreen(
              path,
              controller,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin : EdgeInsets.only(right: 30, top: 10),
                child: FloatingActionButton(
                    heroTag: "btn3",
                    backgroundColor: secondColor,
                    onPressed: () {
                      controller.initialize();
                      controller.play();
                    },
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 0, top: 10),
                child: FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: secondColor,
                    onPressed: () {
                      setState(() {
                        if (enCours) {
                          controller.pause();
                          enArret = false;
                          enCours = false;
                          enPause = true;
                        } else {
                          if (enArret) {
                            controller.initialize();
                            controller.addListener(checkVideo);
                            enArret = false;
                            enCours = true;
                            enPause = false;
                          }
                          enCours = true;
                          enPause = false;
                          controller.play();
                        }
                      });
                    },
                    child: Icon(
                      _icon[0][enCours],
                      color: Colors.white,
                    )),
              ),
              Container(
                margin : EdgeInsets.only(left: 30, top: 10),
                child: FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: secondColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    )
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: new Container(
              height: hauteur / 3,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:20, right: 20, top: 10, bottom: 10),
                child: SingleChildScrollView(
                  child: Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Lobster",
                      fontSize: 16,
                      color: secondColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkVideo() {
    if (controller.value.position == controller.value.duration ||
        controller.value.position ==
            Duration(seconds: 0, minutes: 0, hours: 0)) {
      setState(() {
        enArret = true;
        enCours = false;
        enPause = false;
      });
    } else if (controller.value.position < controller.value.duration &&
        controller.value.position >
            Duration(seconds: 0, minutes: 0, hours: 0) &&
        !enPause) {
      setState(() {
        enCours = true;
        enArret = false;
        enPause = false;
      });
    } else if (enPause) {
      setState(() {
        enCours = false;
        enArret = false;
        enPause = true;
      });
    } else if (enArret) {
      setState(() {
        enCours = false;
        enArret = true;
        enPause = false;
      });
    } else if (enCours) {
      setState(() {
        enCours = true;
        enArret = false;
        enPause = false;
      });
    }
  }
}
