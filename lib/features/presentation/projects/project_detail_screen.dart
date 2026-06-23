import 'package:flutter/material.dart';

import '../../data/model/project_model.dart';
import '../timeline/project_timeline_widget.dart';


class ProjectDetailScreen
    extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailScreen({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(
          project.projectName,
        ),
      ),
      body: SingleChildScrollView(
        padding:
        const EdgeInsets.all(
            16),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment
              .start,
          children: [
            Card(
              child: ListTile(
                title:
                Text(
                  project.creatorName,
                ),
                subtitle:
                Text(
                  "Budget ₹${project.budget}",
                ),
              ),
            ),

            const SizedBox(
                height: 20),

            const Text(
              "Project Timeline",
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(
                height: 20),

            ProjectTimeline(
              status:
              project.status,
            ),
          ],
        ),
      ),
    );
  }
}