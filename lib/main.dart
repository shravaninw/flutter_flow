import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _widget = [];
  int i = 0;
  List<Widget> _row = [];
  List<Widget> _column = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Draggable(
                feedback: Text(
                  'Hello World',
                  style: TextStyle(color: Colors.black),
                ),
                child: Text('Hello World'),
                data: Text('Hello World'),
              ),
              Draggable(
                feedback: Container(
                  color: Colors.green,
                  height: 100,
                  width: 100,
                ),
                child: Container(
                  color: Colors.green,
                  height: 100,
                  width: 100,
                ),
                data: Container(
                  color: Colors.green,
                  height: 100,
                  width: 100,
                ),
              ),
              Draggable(
                feedback: Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                    child: Column(
                      children: [],
                    )),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                  child: Column(
                    children: [],
                  ),
                ),
                data: Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                    child: Column(
                      children: [],
                    )),
              ),
              Draggable(
                feedback: Container(
                    height: 100,
                    width: 100,
                    color: Colors.pinkAccent,
                    child: Row(
                      children: [],
                    )),
                child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.pinkAccent,
                    child: Row(
                      children: [],
                    )),
                data: Container(
                    height: 100,
                    width: 100,
                    color: Colors.pinkAccent,
                    child: Row(
                      children: [],
                    )),
              )
            ],
          )),
      DragTarget(
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ListView.builder(
                  itemCount: _widget.length,
                  itemBuilder: (BuildContext context, int index) {
                    i = index;
                    return DragTarget(
                      builder: (BuildContext context, List<Object?> candidate,
                          List<dynamic> rejected) {
                        if (candidateData == Column()) {
                          return Container(
                              child: Column(
                                  children: List.generate(_column.length,
                                      (index) => _column[index])));
                        }
                        if (candidateData == Row()) {
                          return Container(
                              child: Row(
                                  children: List.generate(
                                      _row.length, (index) => _row[index])));
                        }
                        return _widget[index];
                      },
                      onAccept: (Widget value) {
                        if (candidateData == Column())
                          _column.add(value);
                        else if (candidateData == Row()) _row.add(value);
                      },
                    );
                  }));
        },
        onAccept: (Widget value) {
          setState(() {
            _widget.add(value);
          });
        },
      )
    ]));
  }
}
