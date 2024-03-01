import 'package:flutter/material.dart';

import 'models/check_item.dart';

class CheckItemRowWidget extends StatelessWidget {
  static const TOP_MARGIN = 13.0;
  static const LINE_HEIGHT = 1.4;
  final CheckItem checkItem;
  final Function checkboxHandler;

  CheckItemRowWidget({
    required this.checkItem,
    required this.checkboxHandler,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemCheckbox(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: TOP_MARGIN,
              ),
              child: _buildItemText(),
            ),
          ),
        ],
      ),
    );
  }

  _toggleCheckbox() {
    this.checkItem.checked = !this.checkItem.checked;
    this.checkboxHandler();
  }

  Text _buildItemText() {
    return Text(
      checkItem.text,
      style: TextStyle(
          height: LINE_HEIGHT,
          decoration: this.checkItem.checked
              ? TextDecoration.lineThrough
              : TextDecoration.none),
    );
  }

  Checkbox _buildItemCheckbox() {
    return Checkbox(
      value: checkItem.checked,
      onChanged: (isChecked) {
        this.checkItem.checked = isChecked ?? false;
        this.checkboxHandler();
      },
    );
  }
}
