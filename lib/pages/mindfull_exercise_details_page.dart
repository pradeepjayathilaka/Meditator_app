import 'package:flutter/material.dart';
import 'package:meditator_app/models/mindfull_exercise_mdel.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class MindfullExerciseDetailsPage extends StatelessWidget {
  final MindfulnessExercise mindfulnessExercise;
  const MindfullExerciseDetailsPage({
    super.key,
    required this.mindfulnessExercise,
  });
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "Could not launvh $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mindfull Exercise Deatails",
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mindfulnessExercise.name,
                style: AppTextStyles.titleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                mindfulnessExercise.category,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                mindfulnessExercise.description,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Instructions",
              ),
              const SizedBox(
                height: 20,
              ),
              ...mindfulnessExercise.instructions.map(
                (instruction) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 8,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(instruction),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.timer,
                    color: AppColors.primaryGrey,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${mindfulnessExercise.duration}min",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await _launchUrl(mindfulnessExercise.instructionsUrl);
                },
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(AppColors.primaryGreen)),
                child: Text(
                  "View Deatails Instructions",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
