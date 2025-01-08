import 'package:flutter/material.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';
import 'package:meditator_app/models/mindfull_exercise_mdel.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/providers/meditation_provider.dart';
import 'package:meditator_app/providers/mindfull_exercise_provide.dart';
import 'package:meditator_app/providers/sleep_exercise_provider.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier {
  List<dynamic> _allData = [];
  List<dynamic> _filteredData = [];

  //get all the data from other providers
  Future<void> getData(BuildContext context) async {
    //Ensures this runs after build
    await Future.delayed(Duration.zero);

    //mindfull exercise
    final List<MindfulnessExercise> mindfullExercises =
        Provider.of<MindfullExerciseProvide>(context, listen: false)
            .mindfullExercises;

    //meditations
    final List<MeditationExercise> meditationExercise =
        Provider.of<MeditationProvider>(context, listen: false)
            .meditationExercise;

    //sleep exercise
    final List<SleepExercise> sleepExercises =
        Provider.of<SleepExerciseProvider>(context, listen: false)
            .sleepExercises;
    _allData = [
      ...mindfullExercises,
      ...meditationExercise,
      ...sleepExercises,
    ];

    _filteredData = _allData;
    notifyListeners();
  }

  //getter
  List<dynamic> get filterData => _filteredData;
}
