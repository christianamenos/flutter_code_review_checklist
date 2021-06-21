import 'dart:convert';

class CheckItem {
  String text;
  bool checked;

  CheckItem({
    required this.text,
    this.checked = false,
  });

  factory CheckItem.fromMap(Map checkItemMap) {
    return CheckItem(
      text: checkItemMap['text'],
      checked: checkItemMap['checked'],
    );
  }

  Map toMap() {
    return {
      'text': this.text,
      'checked': this.checked,
    };
  }

  factory CheckItem.clone({required CheckItem original, bool? checked}) {
    return CheckItem(
      text: original.text,
      checked: checked ?? original.checked,
    );
  }

  @override
  String toString() {
    return '{ text: ${this.text}, checked: ${this.checked} }';
  }

  String toJson() {
    return jsonEncode(this.toMap());
  }

  factory CheckItem.fromJson(String json) {
    return CheckItem.fromMap(jsonDecode(json));
  }
}
