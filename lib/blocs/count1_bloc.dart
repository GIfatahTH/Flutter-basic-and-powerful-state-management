import 'package:flutter/material.dart';

import 'bloc_setting.dart';
import 'main_bloc.dart';

class Count1Bloc extends BloCSetting {
  int counter1 = 0;

  IconData counter1Icon = Icons.add;

  incrementCounter(state) {
    counter1Icon = (counter1 < 10) ? Icons.add : Icons.add_circle;

    rebuildWidgets(
      setStates: () {
        counter1++;
      },
      states: [state],
    );

    mainBloc?.counter1++;
  }

  // // an alternative way:
  // incrementCounter(state) {
  //   counter1Icon = (counter1 < 10) ? Icons.add : Icons.add_circle;
  //   counter1++;
  //   mainBloc?.counter1++;
  // // we can await an async task, before rebuilding the widgets
  //   rebuildWidgets(states: [state]);
  // }
}

Count1Bloc count1Bloc;
