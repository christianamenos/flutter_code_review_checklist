class CheckItem {
  String text;
  bool checked;

  CheckItem({
    required this.text,
    this.checked = false,
  });

  factory CheckItem.fromMap(Map json) {
    return CheckItem(
      text: json['text'],
      checked: json['checked'],
    );
  }

  factory CheckItem.clone({required CheckItem original, bool? checked}) {
    return CheckItem(
      text: original.text,
      checked: checked ?? original.checked,
    );
  }

  @override
  String toString() {
    return '{ name: ${this.text}, checked: ${this.checked} }';
  }
}
