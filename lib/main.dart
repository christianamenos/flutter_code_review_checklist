import 'package:flutter/material.dart';

import 'checklist.dart';
import 'models/check_item.dart';
import 'models/section.dart';
import 'repositories/checklist_repository.dart';
import 'repositories/checklist_repository_map.dart';

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
  List<Section> checklistSections = [];
  ChecklistRepository checklistRepository = ChecklistRepositoryMap();

  @override
  void initState() {
    super.initState();
    this.checklistSections = this.checklistRepository.getDefaultChecklist();
  }

  void checkboxHandler(CheckItem checkItem) {
    print("Execute handler");
    print(checkItem.text);
    print(checkItem.checked);
    var found = this._iterateSubsectionsToUpdateCheckItem(this.checklistSections, checkItem);
    print("FOUND?");
    print(found);
    print(this.checklistSections.toString());
  }

  // bool iterateCheckItems
  bool _iterateSubsectionsToUpdateCheckItem(
      List<Section> sections, CheckItem targetCheckItem) {
    for (var section in sections) {
      for (var checkItem in section.checkItems) {
        if (checkItem.text == targetCheckItem.text) {
          checkItem.checked = targetCheckItem.checked;
          return true;
        }
      }
      return _iterateSubsectionsToUpdateCheckItem(
          section.subsections, targetCheckItem);
    }
    return false;
  }

  void _resetChecklist() {
    setState(() {
      this.checklistSections = this.checklistRepository.getDefaultChecklist();
    });
  }

  List<Widget> _buildChecklist() {
    print('IEP!');
    return checklistSections
        .map((section) => CheckList(section, checkboxHandler))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD MAIN!");
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
      body: Column(
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
      floatingActionButton: FloatingActionButton(
        onPressed: _resetChecklist,
        tooltip: 'Reset',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
