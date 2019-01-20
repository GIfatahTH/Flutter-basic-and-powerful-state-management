import 'package:flutter/material.dart';

import './blocs/main_bloc.dart';
import './counter1.dart';
import './counter2.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Blocs are provided by instantiating them in initState() fo a statefullWidget
  // and destroying them in dispose() method. They can be provided using the inheritedWidget
  @override
  void initState() {
    super.initState();
    mainBloc =
        MainBloc(); // initializing mainBloc. It will be availible to all widgets underdeath; that is All the app.
  }

  @override
  void dispose() {
    mainBloc = null; // destroying the mainBloc object to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SetState management",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mainBloc.title), // tilte variable from the mainBloc
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Go To Counter 1'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Counter1(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text('Go To Counter 2'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Counter2Init(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
