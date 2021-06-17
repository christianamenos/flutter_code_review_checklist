import '../models/section.dart';

abstract class ChecklistRepository {
  List<Section> getDefaultChecklist();
}