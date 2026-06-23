import 'package:creator_marketplace/features/presentation/auth/login_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/data/model/creator_model.dart';
import '../features/data/model/project_model.dart';
import '../features/presentation/booking/book_creator_screen.dart';
import '../features/presentation/creators/creator_detail_screen.dart';
import '../features/presentation/creators/creator_list_screen.dart';
import '../features/presentation/projects/ongoing_projects_screen.dart';
import '../features/presentation/projects/project_detail_screen.dart';
import '../features/presentation/projects/project_summary_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/creators',
        builder: (context, state) {
          return const CreatorListingScreen();
        },
      ),
      GoRoute(
        path: '/creator-details',
        builder: (context, state) {
          return CreatorDetailScreen(
            creator:
            state.extra
            as CreatorModel,
          );
        },
      ),

      GoRoute(
        path: '/book-creator',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;

          return BookCreatorScreen(
            creatorName:
            data["creator"].name,
            packageName:
            data["package"],
            amount:
            data["amount"],
          );
        },
      ),
      GoRoute(
        path: '/ongoing-projects',
        builder: (context, state) {
          return const OngoingProjectsScreen();
        },
      ),
      GoRoute(
        path: '/project-details',
        builder: (context, state) {
          return ProjectDetailScreen(project: state.extra as ProjectModel);
        },
      ),

      GoRoute(
        path: '/project-summary',
        builder: (context, state) {
          return const ProjectSummaryScreen();
        },
      ),
    ],
  );
}