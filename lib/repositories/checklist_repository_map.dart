import 'package:code_review_checklist/models/section.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  void saveChecklistState(List<Section> checklist) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList(
      "checklist",
      checklist.map((section) => section.toJson()).toList(),
    );
  }

  @override
  Future<List<Section>> getChecklistLastState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var checklist = preferences
        .getStringList("checklist")
        ?.map((sectionJson) => Section.fromJson(sectionJson))
        .toList();
    return checklist ?? [];
  }

  List<Section> _buildSectionListFromMap(List<Map> defaultSections) {
    return defaultSections
        .map((sectionMap) => Section.fromMap(sectionMap))
        .toList();
  }

  List<Map> _getDefaultChecklistMap() {
    return [
      {
        'section_name': 'Correctness',
        'check_items': [
          {
            'text': 'The code exposes or consumes the API as agreed',
            'checked': false,
          },
          {
            'text':
                'The change solves the expected purpose and only this purpose',
            'checked': false,
          },
          {
            'text':
                'The content (texts/number/dates/timezone/...) is localized',
            'checked': false,
          },
          {
            'text':
                'There are not too many changes (divide into smaller code reviews, nobody wants to read long code reviews, the focus decreases over time)',
            'checked': false,
          },
        ],
      },
      {
        'section_name': 'Testing',
        'check_items': [
          {
            'text':
                'The code was tested end to end (the steps to test the code are documented)',
            'checked': false,
          },
          {
            'text': 'Tests verify the correctness of the change',
            'checked': false,
          },
          {
            'text': 'Tests cover edge cases / errors / exceptions',
            'checked': false,
          },
          {
            'text': 'Automated test coverage us above the threshold (unit / integration / e2e)',
            'checked': false,
          },
          {
            'text':
                'Main branch was rebased / merged with latest changes and tested with those changes',
            'checked': false,
          },
          {
            'text': 'The change was tested on the targeted devices / languages',
            'checked': false,
          },
          {
            'text': 'The change was self-reviewed',
            'checked': false,
          },
        ],
      },
      {
        'section_name': 'Code style',
        'check_items': [
          {
            'text': 'The name of the variables / functions / classes are understandable',
            'checked': false,
          },
          {
            'text': 'The code follows the existing code style',
            'checked': false,
          },
          {
            'text': 'The code does not include unused code or imports',
            'checked': false,
          },
          {
            'text': 'The code is correctly indented',
            'checked': false,
          },
        ],
      },
      {
        'section_name': 'Documentation',
        'check_items': [
          {
            'text': 'The code does not have unnecessary comments',
            'checked': false,
          },
          {
            'text': 'Comments are formatted properly (javadoc, ...)',
            'checked': false,
          },
          {
            'text':
                'The code review / commit message is descriptive',
            'checked': false,
          },
          {
            'text':
                'The code review / commit message contain a reference to the task (jira / trello / ...)',
            'checked': false,
          },
          {
            'text':
                'The code review / commit message contain a visual demonstrating the UX of the change',
            'checked': false,
          },
          {
            'text': 'All reviewers were added',
            'checked': false,
          },
          {
            'text':
                'The comments are understandable and free of typographical errors',
            'checked': false,
          },
        ],
      },
      {
        'section_name': 'Best practices',
        'check_items': [
          {
            'text': 'The solution does not over-engineer',
            'checked': false,
          },
          {
            'text': 'Functions are short and do what their name says',
            'checked': false,
          },
          {
            'text': 'There is not a better / simpler way to do the same',
            'checked': false,
          },
          {
            'text': 'The code is scalable',
            'checked': false,
          },
          {
            'text': 'The code is thread-safe',
            'checked': false,
          },
          {
            'text':
                'The code follow Design Principles (SOLID, architectures, design patterns, language specific patterns, ...)',
            'checked': false,
          },
          {
            'text': 'Errors are correctly handled',
            'checked': false,
          },
          {
            'text':
                'Configuration / build artifacts are not added in this change (.idea / .vscode / build / ...)',
            'checked': false,
          },
          {
            'text':
                'The code does not use hardcoded values, uses constants / configuration values instead',
            'checked': false,
          },
          {
            'text': 'The code avoids multiple if-else / switch blocks',
            'checked': false,
          },
          {
            'text': 'The code is null-safe',
            'checked': false,
          },
          {
            'text':
                'The code uses language / framework specific features (do not reinvent the wheel)',
            'checked': false,
          },
          {
            'text': 'It does not exist duplicated code',
            'checked': false,
          },
          {
            'text':
                'The change does not affect the performance of the system (CPU / Memory / Disk / Network)',
            'checked': false,
          },
        ],
      },
      {
        'section_name': 'Dependencies',
        'check_items': [
          {
            'text': 'The code do not use deprecated / obsolete dependencies',
            'checked': false,
          },
          {
            'text': 'The code does not contain vulnerable dependencies',
            'checked': false,
          },
        ],
      },
      {
        'section_name': 'Logs and metrics',
        'check_items': [
          {
            'text': 'Debug logs or prints were removed',
            'checked': false,
          },
          {
            'text': 'Important events are properly logged',
            'checked': false,
          },
          {
            'text': 'The code creates metrics to monitor the healthiness of the system',
            'checked': false,
          },
          ],
      },
      {
        'section_name': 'Security and privacy',
        'check_items': [
          {
            'text': 'The change is not exposing private information or endpoints (do not expose information to unauthorized users or hackers)',
            'checked': false,
          },
          {
            'text': 'Input data are sanitized',
            'checked': false,
          },
          {
            'text': 'Private information is encrypted properly',
            'checked': false,
          },
          {
            'text': 'The code is protected to most common attacks (XSS / SQL injection / authentication / authorization / encryption / ...)',
            'checked': false,
          },
        ],
      },
    ];
  }
}
