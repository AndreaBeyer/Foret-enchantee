import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class HelpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return isIOS ? getIOS() : getAndroid();
  }

  Widget getIOS() {
    return CupertinoPageScaffold();
  }

  Widget getAndroid() {
    return Scaffold();
  }
}
