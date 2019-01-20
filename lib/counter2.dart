import 'package:flutter/material.dart';
import 'blocs/main_bloc.dart';
import 'blocs/count2_bloc.dart';

class Counter2Init extends StatefulWidget {
  @override
  _Counter2InitState createState() => _Counter2InitState();
}

class _Counter2InitState extends State<Counter2Init> {
  // the sole objective of this statefulWidget is to provide the bloc
  @override
  void initState() {
    super.initState();
    count2Bloc = Count2Bloc();
  }

  @override
  void dispose() {
    count2Bloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Counter2();
  }
}

class Counter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mainBloc.title),
      ),
      body: Center(
        child: Counter2Text(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: count2Bloc
            .incrementCounter, // from this statelessWidget we can control the rebuild of another statefulWidgets. "Counter2Text" for this particular case
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Counter2Text extends StatefulWidget {
  @override
  _Counter2TextState createState() => _Counter2TextState();
}

class _Counter2TextState extends State<Counter2Text> {
  @override
  void initState() {
    super.initState();
    count2Bloc.counter2State =
        this; // now counter2State reference to the state of this widget. think of it as it has the ID of this widget
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button, on total, this many times:',
        ),
        Text(
          '${mainBloc.counter2}',
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '${count2Bloc.counter2}',
          style: Theme.of(context).textTheme.display1,
        ),
      ],
    );
  }
}
