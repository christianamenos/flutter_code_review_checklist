import 'check_item.dart';

class Section {
  String sectionName;
  List<CheckItem> checkItems;
  List<Section> subsections;

  Section({
    required this.sectionName,
    required this.checkItems,
    this.subsections = const [],
  });

  factory Section.fromMap(Map json) {
    return Section(
      sectionName: json['section_name'] ?? json['sectionName'],
      checkItems: ((json['check_items'] ?? json['checkItems'] ?? [])
              as List<Map<String, dynamic>>)
          .map((checkItem) => CheckItem.fromMap(checkItem))
          .toList(),
      subsections: (json['subsections'] as List)
          .map((subsection) => Section.fromMap(subsection))
          .toList(),
    );
  }

  @override
  String toString() {
    var checkItemsString = '[';
    this.checkItems.forEach((checkItem) {
      checkItemsString += ' ${checkItem.toString()}, ';
    });
    checkItemsString += ']';
    var subsectionsString = '[';
    this.subsections.forEach((subsection) {
      subsectionsString += ' ${subsection.toString()}, ';
    });
    subsectionsString += ']';
    return '{ sectionName: ${this.sectionName}, check_items: $checkItemsString, subsections: $subsectionsString }';
  }
}
