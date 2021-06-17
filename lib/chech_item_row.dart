import 'package:flutter/material.dart';

import 'models/check_item.dart';

class CheckItemRow extends StatelessWidget {

  CheckItem checkItem;
  Function checkboxHandler;

  CheckItemRow({required this.checkItem, required this.checkboxHandler});

/*
class CheckItemRow extends StatefulWidget {
  CheckItemRow(
      {Key? key, required this.checkItem, required this.checkboxHandler})
      : super(key: key);

  CheckItem checkItem;
  Function checkboxHandler;

  @override
  _CheckItemRowState createState() =>
      _CheckItemRowState(this.checkItem, this.checkboxHandler);
}

class _CheckItemRowState extends State<CheckItemRow> {
  // final Function checkboxHandler;

  CheckItem checkItem;
  Function checkboxHandler;

  _CheckItemRowState(this.checkItem, this.checkboxHandler);
*/
  // CheckItemRow(this.checkItem, this.checkboxHandler);
  @override
  Widget build(BuildContext context) {
    print('HOLA?');
    print(checkItem.text);
    print(checkItem.checked);
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
