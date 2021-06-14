import 'package:flutter/material.dart';

import 'models/section.dart';

class CheckList extends StatelessWidget {
  final Section checklist;

  CheckList(this.checklist);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.checklist.sectionName),
        Column(
          children: this
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
        ),
      ],
    );
  }
}
