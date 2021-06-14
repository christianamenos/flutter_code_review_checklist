class CheckItem {
  String text;
  bool checked;

  CheckItem({
    required this.text,
    this.checked = false,
  });

  factory CheckItem.fromJson(Map json) {
    return CheckItem(
      text: json['text'],
      checked: json['checked'],
    );
  }
}
