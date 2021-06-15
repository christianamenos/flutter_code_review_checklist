import 'package:flutter/material.dart';

import 'models/section.dart';

class CheckList extends StatelessWidget {
  final Section checklist;
  static const DEFAULT_MARGIN = 10.0;

  CheckList(this.checklist);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: DEFAULT_MARGIN,
        right: DEFAULT_MARGIN,
        top: DEFAULT_MARGIN,
      ),
      child: Column(
        children: [
          Text(
            this.checklist.sectionName,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Column(
            children: [
              ...this
                  .checklist
                  .checkItems
                  .map((checkItem) => Row(
                        children: [
                          Checkbox(
                            value: checkItem.checked,
                            onChanged: (b) => {},
                          ),
                          Text(checkItem.text),
                        ],
                      ))
                  .toList(),
              ...this
                  .checklist
                  .subsections
                  .map((subsection) => CheckList(subsection))
                  .toList(),
            ],
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
