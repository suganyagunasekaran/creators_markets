import 'package:creator_marketplace/features/presentation/projects/project_card.dart';
import 'package:creator_marketplace/features/presentation/projects/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class OngoingProjectsScreen
    extends ConsumerWidget {
  const OngoingProjectsScreen(
      {super.key});

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final projects =
    ref.watch(projectProvider);

    return Scaffold(
      appBar: AppBar(
        title:
        const Text(
          "Ongoing Projects",
        ),
      ),
      body: ListView.builder(
        itemCount:
        projects.length,
        itemBuilder:
            (context, index) {
          return ProjectCard(
            project:
            projects[index],
            onTap: () {
              context.push('/project-details',
                extra:
                projects[index],
              );
            },
          );
        },
      ),
    );
  }
}