import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vet_project_flutter_frontend/src/features/parasitologicalAnalyses/models/ParasitologicalAnalysis.dart';
import 'package:vet_project_flutter_frontend/src/features/parasitologicalAnalyses/screens/ParasitologicalAnalysisFormScreenWidget.dart';

class ParasitologicalAnalysesListDataTableRow {
  late List<DataRow> rows;
  late BuildContext _context;
  late Function? _onBack;

  _navigateForm(int id) {
    pushNewScreen(_context,
            screen: ParasitologicalAnalysisFormScreenWidget(id: id))
        .then((value) => {if (_onBack != null) _onBack!()});
  }

  ParasitologicalAnalysesListDataTableRow(BuildContext context,
      List<ParasitologicalAnalysis>? parasitologicalAnalysisList,
      {Function? onBack}) {
    _context = context;
    _onBack = onBack;

    if (parasitologicalAnalysisList == null) {
      rows = [];
      return;
    }

    rows = parasitologicalAnalysisList
        .map((s) => DataRow(
              cells: [
                DataCell(Text(s.status != null ? s.status?.name as String : ""),
                    showEditIcon: true,
                    onTap: () => _navigateForm(s.id as int)),
                DataCell(Text(s.assigneeUser != null
                    ? "${s.assigneeUser?.firstName} ${s.assigneeUser?.lastName}"
                    : "Yok")),
                DataCell(Text(s.approvedByUser != null
                    ? "${s.approvedByUser?.firstName} ${s.approvedByUser?.lastName}"
                    : "Yok")),
                DataCell(Text(s.createdAt.toString().substring(0, 16))),
                DataCell(Text(s.updatedAt != null
                    ? s.updatedAt.toString().substring(0, 16)
                    : "")),
              ],
            ))
        .toList();
  }
}
