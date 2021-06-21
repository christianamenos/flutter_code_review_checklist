import 'dart:convert';

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

  factory Section.fromMap(Map sectionMap) {
    return Section(
      sectionName: sectionMap['section_name'] ?? sectionMap['sectionName'],
      checkItems: ((sectionMap['check_items'] ?? sectionMap['checkItems'] ?? [])
              as List<dynamic>)
          .map((checkItem) => CheckItem.fromMap(checkItem))
          .toList(),
      subsections: (sectionMap['subsections'] ?? [])
          .map<Section>((subsection) => Section.fromMap(subsection))
          .toList(),
    );
  }

  Map toMap() {
    return {
      'section_name': this.sectionName,
      'check_items':
          this.checkItems.map((checkItem) => checkItem.toMap()).toList(),
      'subsections':
          this.subsections.map((subsection) => subsection.toMap()).toList(),
    };
  }

  @override
  String toString() {
    var checkItemsString = '[';
    this.checkItems.forEach((checkItem) {
      checkItemsString += ' ${checkItem.toString()}, ';
    });
    checkItemsString += ']';
    var subsectionsString = '[';
    subsectionsString += this
        .subsections
        .map((subsection) => subsection.toString())
        .join(", ")
        .toString();
    subsectionsString += ']';
    return '{ sectionName: ${this.sectionName}, check_items: $checkItemsString, subsections: $subsectionsString }';
  }

  String toJson() {
    return jsonEncode(this.toMap());
  }

  factory Section.fromJson(String json) {
    return Section.fromMap(jsonDecode(json));
  }
}
