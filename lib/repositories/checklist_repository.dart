import '../models/section.dart';

abstract class ChecklistRepository {
  List<Section> getDefaultChecklist();
  void saveChecklistState(List<Section> checklist);
  Future<List<Section>> getChecklistLastState();
}