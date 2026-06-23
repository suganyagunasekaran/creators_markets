import '../data_source/project_status.dart';

class ProjectModel {
  final String projectName;
  final String creatorName;
  final double budget;
  final ProjectStatus status;

  ProjectModel({
    required this.projectName,
    required this.creatorName,
    required this.budget,
    required this.status,
  });
}