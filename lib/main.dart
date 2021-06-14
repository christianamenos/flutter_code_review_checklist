import 'package:flutter/material.dart';

import 'models/section.dart';
import 'check_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Review Checklist',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Checklist'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var checkSections = [];

  /*
   * TODO: call resetChecklist? Move somewhere else? Probably this is called
   * eveytime the widget is rendered, for example after minimizing the app.
   */

  void _resetChecklist() {
    setState(() {
      // TODO: clean checklists
      /*
        {
          'section_name': 'Correctness',
        },
        {
          'section_name': 'Documentation',
        },
        {
          'section_name': 'Testing',
          'check_items': ['coverage': false,
          'branch_coverage': false,]
        }
        */
    });
  }

  List<Widget> _buildChecklist() {
    var sections = [
      {
        'section_name': 'Readability',
        'check_items': [
          {
            'text': 'The code is correctly indented',
            'checked': false,
          },
          {
            'text': 'The code format is consistent',
            'checked': false,
          },
        ],
        'subsections': [
          {
            'section_name': 'Variables',
            'check_items': [
              {
                'text': 'Variable names are understandable',
                'checked': false,
              },
            ],
            'subsections': [],
          }
        ]
      },
    ];
    return sections.map((sectionMap) {
      var section = Section.fromJson(sectionMap);
      return CheckList(section);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildChecklist(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetChecklist,
        tooltip: 'Reset',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
