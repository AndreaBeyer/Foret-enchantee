import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'main.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen(this.path, this.controller) : super();
  final String path;
  final VideoPlayerController controller;

  @override
  _VideoPlayerScreenState createState() =>
      _VideoPlayerScreenState(path, controller);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  _VideoPlayerScreenState(this.path, this.controller) : super();

  final String path;
  final VideoPlayerController controller;

  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _initializeVideoPlayerFuture = controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: secondColor,
      ),
      width: largeur + 2,
      height: hauteur * 2 /5,
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(
                    controller
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(primaryColor),
              ));
            }
          }),
    );
  }
}
