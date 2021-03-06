import 'package:flutter/material.dart';

import 'chech_item_row.dart';
import 'models/section.dart';

class CheckList extends StatelessWidget {
  final Section checklist;
  final Function checkboxHandler;
  static const DEFAULT_MARGIN = 10.0;

  CheckList(this.checklist, this.checkboxHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: DEFAULT_MARGIN,
        right: DEFAULT_MARGIN,
        top: DEFAULT_MARGIN / 2,
        bottom: DEFAULT_MARGIN / 2
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
                  .map((checkItem) => CheckItemRow(
                        checkItem: checkItem,
                        checkboxHandler: checkboxHandler,
                      ))
                  .toList(),
              ...this
                  .checklist
                  .subsections
                  .map((subsection) => CheckList(
                        subsection,
                        checkboxHandler,
                      ))
                  .toList(),
            ],
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
