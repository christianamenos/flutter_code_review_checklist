import 'package:flutter/material.dart';

import 'chech_item_row_widget.dart';
import 'models/section.dart';

class SectionWidget extends StatelessWidget {
  final Section section;
  final Function checkboxHandler;
  static const HORIZONTAL_MARGIN = 10.0;
  static const VERTICAL_MARGIN = HORIZONTAL_MARGIN / 2;
  static const FONT_SIZE = 20.0;

  SectionWidget(this.section, this.checkboxHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: HORIZONTAL_MARGIN,
        right: HORIZONTAL_MARGIN,
        top: VERTICAL_MARGIN,
        bottom: VERTICAL_MARGIN,
      ),
      child: Column(
        children: [
          _buildSectionName(),
          ..._buildCheckItems(),
          ..._buildSubsections(),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget _buildSectionName() {
    return Text(
      this.section.sectionName,
      style: TextStyle(
        fontSize: FONT_SIZE,
      ),
    );
  }

  List<Widget> _buildCheckItems() {
    return section.checkItems
        .map((checkItem) => CheckItemRowWidget(
              checkItem: checkItem,
              checkboxHandler: checkboxHandler,
            ))
        .toList();
  }

  List<Widget> _buildSubsections() {
    return section.subsections
        .map((subsection) => SectionWidget(
              subsection,
              checkboxHandler,
            ))
        .toList();
  }
}
