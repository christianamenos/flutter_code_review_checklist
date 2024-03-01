import 'package:flutter/material.dart';

import 'section_widget.dart';
import 'models/section.dart';
import 'repositories/checklist_repository.dart';
import 'repositories/checklist_repository_map.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const BOTTOM_MARGIN = 70.0;
  List<Section> checklistSections = [];
  ChecklistRepository checklistRepository = ChecklistRepositoryMap();

  @override
  void initState() {
    super.initState();
    this.checklistSections = this.checklistRepository.getDefaultChecklist();
    _getLastState();
  }

  void _getLastState() async {
    var checklist = await this.checklistRepository.getChecklistLastState();
    if (checklist.length > 0) {
      setState(() {
        this.checklistSections = checklist;
      });
    }
  }

  void checkboxHandler() {
    // TODO: change by Provider/Consumer?
    this.checklistRepository.saveChecklistState(checklistSections);
    setState(() {
      // The checkItem was changed in the checkItem reference
    });
  }

  void _resetChecklist() {
    setState(() {
      this.checklistSections = this.checklistRepository.getDefaultChecklist();
      this.checklistRepository.saveChecklistState(checklistSections);
    });
  }

  List<Widget> _buildChecklist() {
    return checklistSections
        .map((section) => SectionWidget(section, checkboxHandler))
        .toList();
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            bottom: BOTTOM_MARGIN,
          ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetChecklist,
        tooltip: 'Reset',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}