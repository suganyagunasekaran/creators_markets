import 'package:flutter/material.dart';

import '../../data/model/project_model.dart';


class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,

        title: Text(
          project.projectName,
        ),

        subtitle: Text(
          project.creatorName,
        ),

        trailing:
        const Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}