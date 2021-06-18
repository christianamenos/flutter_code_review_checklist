import 'package:flutter/material.dart';

import 'models/check_item.dart';

class CheckItemRow extends StatelessWidget {
  final CheckItem checkItem;
  final Function checkboxHandler;

  CheckItemRow({
    required this.checkItem,
    required this.checkboxHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: checkItem.checked,
          onChanged: (isChecked) {
            this.checkItem.checked = isChecked ?? false;
            this.checkboxHandler(this.checkItem);
          },
        ),
        Text(checkItem.text),
      ],
    );
  }
}
