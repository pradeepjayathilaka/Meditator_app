import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:meditator_app/models/mindfull_exercise_mdel.dart';
import 'package:meditator_app/pages/main_screen.dart';
import 'package:meditator_app/pages/mindfull_exercise_details_page.dart';
import 'package:meditator_app/router/router_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: RouterNames.mainPage,
        builder: (context, state) {
          return const MainScreen();
        },
      ),
      GoRoute(
        path: "/mindfullExercise",
        name: RouterNames.mindfullExercise,
        builder: (context, state) {
          final mindfulnessExerciseJson =
              state.uri.queryParameters["mindfullExercise"];
          final mindfulnessExercise = MindfulnessExercise.fromJson(
              jsonDecode(mindfulnessExerciseJson!));
          return MindfullExerciseDetailsPage(
            mindfulnessExercise: mindfulnessExercise,
          );
        },
      )
    ],
  );
}
