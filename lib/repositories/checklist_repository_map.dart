import 'package:code_review_checklist/models/section.dart';

import 'checklist_repository.dart';

class ChecklistRepositoryMap implements ChecklistRepository {
  static final ChecklistRepositoryMap _instance =
      ChecklistRepositoryMap._instantiate();

  factory ChecklistRepositoryMap() {
    return _instance;
  }

  ChecklistRepositoryMap._instantiate();

  @override
  List<Section> getDefaultChecklist() {
    var defaultSections = this._getDefaultChecklistMap();
    return this._buildSectionListFromMap(defaultSections);
  }

  List<Section> _buildSectionListFromMap(List<Map> defaultSections) {
    print('!!!');
    print(defaultSections.toString());
    return defaultSections
        .map((sectionMap) => Section.fromMap(sectionMap))
        .toList();
  }

  List<Map> _getDefaultChecklistMap() {
    return [
      {
        'section_name': 'Readability',
        'check_items': [
          {
            'text': 'The code is correctly indented',
            'checked': false,
          },
          {
            'text': 'The code format is consistent',
            'checked': false,
          },
        ],
        'subsections': [
          {
            'section_name': 'Variables',
            'check_items': [
              {
                'text': 'Variable names are understandable',
                'checked': false,
              },
            ],
            'subsections': [],
          }
        ]
      },
    ];

    /*
        {
          'section_name': 'Correctness',
        },
        {
          'section_name': 'Documentation',
        },
        {
          'section_name': 'Testing',
          'check_items': ['coverage': false,
          'branch_coverage': false,]
        }
        */
  }
}
