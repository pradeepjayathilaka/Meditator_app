import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:meditator_app/models/function_data_model.dart';
import 'package:meditator_app/models/mindfull_exercise_mdel.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/pages/function_page.dart';
import 'package:meditator_app/pages/main_screen.dart';
import 'package:meditator_app/pages/mindfull_exercise_details_page.dart';
import 'package:meditator_app/pages/mindfull_exercise_timer.dart';
import 'package:meditator_app/pages/sleep_exercise_timer.dart';
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
      ),
      GoRoute(
        path: "/function",
        name: RouterNames.function,
        builder: (context, state) {
          final FunctionData functionData = state.extra as FunctionData;
          return FunctionPage(
            functionData: functionData,
          );
        },
      ),
      GoRoute(
        path: "/mindFullExerciseTimer",
        name: RouterNames.mindfullExerciseTimer,
        builder: (context, state) {
          final mindfulnessExerciseJson =
              state.uri.queryParameters["mindfullExercise"];
          final mindfulnessExercise = MindfulnessExercise.fromJson(
              jsonDecode(mindfulnessExerciseJson!));

          return MindfullExerciseTimer(
              mindfulnessExercise: mindfulnessExercise);
        },
      ),
      GoRoute(
        path: "/sleepExerciseTimer",
        name: RouterNames.sleepExerciseTimer,
        builder: (context, state) {
          final sleepExerciseJson = state.uri.queryParameters["sleepExercise"];
          final sleepExercise =
              SleepExercise.fromJson(jsonDecode(sleepExerciseJson!));
          return SleepExerciseTimer(sleepExercise: sleepExercise);
        },
      )
    ],
  );
}
