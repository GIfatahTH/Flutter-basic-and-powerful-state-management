// this class can be converted to a dart library
// it will be a litte modified to allow us to only work with statelessWidgets in our app

import 'package:flutter/material.dart';

class BloCSetting extends State {
  rebuildWidgets({VoidCallback setStates, List<State> states}) {
    if (states != null) {
      states.forEach((s) {
        if (s != null && s.mounted) s.setState(setStates ?? () {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        "This build function will never be called. it has to be overriden here because State interface requires this");
    return null;
  }
}
