import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_source/project_status.dart';
import '../../data/model/project_model.dart';

final projectProvider =
StateNotifierProvider<
    ProjectNotifier,
    List<ProjectModel>>(
      (ref) => ProjectNotifier(),
);

class ProjectNotifier
    extends StateNotifier<List<ProjectModel>> {
  ProjectNotifier()
      : super([
    ProjectModel(
      projectName:
      "Summer Promotion",
      creatorName:
      "John",
      budget: 15000,
      status: ProjectStatus
          .scriptUploaded,
    ),
  ]);

  void updateStatus(
      int index,
      ProjectStatus status,
      ) {
    final projects = [...state];

    projects[index] =
        ProjectModel(
          projectName:
          projects[index].projectName,
          creatorName:
          projects[index].creatorName,
          budget:
          projects[index].budget,
          status: status,
        );

    state = projects;
  }
}