import 'package:flutter/material.dart';
import 'blocs/main_bloc.dart';
import 'blocs/count1_bloc.dart';

class Counter1 extends StatefulWidget {
  @override
  _Counter1State createState() => _Counter1State();
}

class _Counter1State extends State<Counter1> {
  @override
  void initState() {
    super.initState();
    count1Bloc =
        Count1Bloc(); // the count1Bloc is only available to children of this widget
  }

  @override
  void dispose() {
    count1Bloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mainBloc.title), // title is provided from mainBloc
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button, on total, this many times:',
            ),
            Text(
              '${mainBloc.counter1}', // counter1 value that stores the accumulated value in the mainBloc
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${count1Bloc.counter1}', // when this widget is destroyed this value resets
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => count1Bloc.incrementCounter(
            this), // "this" is passed to the bloc to be used to rebuild this widget after state mutation
        tooltip: 'Increment',
        child: Icon(count1Bloc
            .counter1Icon), // the icon is conditionnally evaluated in the count1Bloc
        // an alternative way : child: Icon(count1Bloc.counter1 < 10 ? Icons.add : Icons.add_circle),
      ),
    );
  }
}

// look at how the widget is free of any buisniss logic
