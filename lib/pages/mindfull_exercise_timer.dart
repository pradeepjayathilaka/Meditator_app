import 'package:flutter/material.dart';
import 'package:meditator_app/models/mindfull_exercise_mdel.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';

class MindfullExerciseTimer extends StatelessWidget {
  final MindfulnessExercise mindfulnessExercise;
  const MindfullExerciseTimer({
    super.key,
    required this.mindfulnessExercise,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mindfulnessExercise.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mindfulnessExercise.category,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                mindfulnessExercise.name,
                style: AppTextStyles.titleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Duration : ${mindfulnessExercise.duration} min",
                style: AppTextStyles.bodyStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                mindfulnessExercise.description,
                style: AppTextStyles.bodyStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Instructions",
                style: AppTextStyles.bodyStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              ...mindfulnessExercise.instructions
                  .map((instructions) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.primaryGreen.withOpacity(0.5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            instructions,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
