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
    return defaultSections
        .map((sectionMap) => Section.fromMap(sectionMap))
        .toList();
  }

  List<Map> _getDefaultChecklistMap() {
    /*
    CORRECTNESS:
    - Does the code expose/uses the API as agreed?
    - Does the change only include the expected changes?
    - Is content (texts/number/dates/timezone/...) localized?
    - There are too many changes? (divide into smaller code reviews, nobody wants to read long code reviews, and focus decreases over time)

    TESTING:
    - Was the code tested end to end? (what are the steps to test the code)
    - Do tests verify the correctness of the change?
    - Do test cover edge cases / errors / exceptions?
    - Does it have enough automated tests (unit/integration/e2e)?
    - Was main branch rebased / merged with latest changes and test it again?
    - Was it tested on the targeted devices/languages?
    - Was the change self-reviewed?

    CODE STYLE:
    - Removed unnecessary comments?
    - Are comments formatted properly (javadoc, ...)?
    - Are the name of the variables/functions/classes clear?
    - Does the code follow the existing code style?
    - Is unused code removed?
    - Is code correctly indented? (even more is it automatically formatted?)

    DOCUMENTATION:
    - Does the commit message describe what was changed?
    - Does the commit message contain a reference to the task (jira/trello/...)?
    - Does the code commit message contain a visual demonstrating the UX of the change? (either an image or a video with a demonstration on what was changed and final UX to get sooner feedback from Product Owners)
    - Are all reviewers added?
    - Are comments understandable and free of typographical errors?

    BEST PRACTICES:
    - The code is not over-engineering?
    - Are functions short and do what they say?
    - Is there an alternative/simpler way to do the same?
    - Are unused imports removed?
    - Is the code scalable?
    - Is the code thread-safe?
    - Does the code follow Design Principles? (like SOLID, architectures, design patterns, language specific patterns, ...)
    - Are errors handled the correct way?
    - Are configuration/build artifacts ignored by the change? (.idea/.vscode/build/...)
    - The code does not use hardcoded values, use constants/configuration values?
    - Does the code avoid having multiple if/else/switch blocks?
    - Is the code null-safe?
    - Does the code use features from language/framework instead of reinventing the wheel?
    - There is no duplicated code?
    - Does the change affect the performance of the system (CPU/Memory/Disk/Network)? (implies caching systems, performant code, ...)

    DEPENDENCIES:
    - Are dependencies in deprecation state/obsolete?
    - Are vulnerable dependencies addressed?

    LOGS AND METRICS:
    - Were debug logs or prints removed?
    - Are important events logged?
    - Does the code create metrics to monitor the healthiness of the system?

    SECURITY AND PRIVACY:
    - The change is not exposing private information or exploitable endpoints? (we are not exposing information to incorrect users or hacker)
    - Are data inputs sanitized?
    - Is private information encrypted properly?
    - The code is secure (XSS/SQL injection/authentication/authorization/encryption/...)?
     */

    return [
      {
        'section_name': '',
        'check_items': [
          {
            'text': '',
            'checked': false,
          },
        ],
      },
      {
        'section_name': 'Best practices',
        'check_items': [
          {
            'text': '',
            'checked': false,
          },
          {
            'text': 'Follows SOLID principles',
            'checked': false,
          },
        ],
      },
      {
        'section_name': 'Testing',
        'check_items': [
          {
            'text': 'Is test/branch coverage above the threshold?',
            'checked': false,
          },
          {
            'text': 'Are corner cases tested?',
            'checked': false,
          },
          {
            'text': 'Are ',
            'checked': false,
          }
        ],
      },
      /*
      {
        'section_name': '',
        'check_items': [
          {
            'text': '',
            'checked': false,
          },
        ],
        'subsections': []
      },
      */
      /*
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
    */
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
    ];
  }
}
