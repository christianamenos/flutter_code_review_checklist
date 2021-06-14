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

  factory Section.fromJson(Map json) {
    return Section(
      sectionName: json['section_name'] ?? json['sectionName'],
      checkItems: ((json['check_items'] ?? json['checkItems'] ?? [])
              as List<Map<String, dynamic>>)
          .map((checkItem) => CheckItem.fromJson(checkItem))
          .toList(),
      subsections: (json['subsections'] as List<Map>)
          .map((subsection) => Section.fromJson(subsection))
          .toList(),
    );
  }
}
