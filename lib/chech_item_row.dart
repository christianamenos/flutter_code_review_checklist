import 'package:flutter/material.dart';

import 'models/check_item.dart';

class CheckItemRow extends StatelessWidget {
  static const DEFAULT_MARGIN = 13.0;
  final CheckItem checkItem;
  final Function checkboxHandler;

  CheckItemRow({
    required this.checkItem,
    required this.checkboxHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: checkItem.checked,
          onChanged: (isChecked) {
            this.checkItem.checked = isChecked ?? false;
            this.checkboxHandler(this.checkItem);
          },
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
                top: DEFAULT_MARGIN,
            ),
            child: Text(
              checkItem.text,
              style: TextStyle(
                  height: 1.4,
                  decoration: this.checkItem.checked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ),
        ),
      ],
    );
  }
}
