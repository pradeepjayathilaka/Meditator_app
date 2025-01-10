import 'package:flutter/material.dart';
import 'package:meditator_app/models/mindfull_exercise_mdel.dart';
import 'package:meditator_app/providers/mindfull_exercise_provide.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';
import 'package:provider/provider.dart';

import '../models/mindfull_exercise_mdel.dart';

class MinfullExercisesPage extends StatelessWidget {
  const MinfullExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minfull Exercises",
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
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search....",
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onChanged: (String value) {
                    Provider.of<MindfullExerciseProvide>(context, listen: false)
                        .searchMindfullExercise(value);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<MindfullExerciseProvide>(
                  builder: (context, mindfulnessExercisesnew, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          mindfulnessExercisesnew.mindfullExercises.length,
                      itemBuilder: (context, index) {
                        MindfulnessExercise singleMindfulnessExercise =
                            mindfulnessExercisesnew.mindfullExercises[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDarkBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                singleMindfulnessExercise.imagePath,
                                width: MediaQuery.of(context).size.width * 0.13,
                                height:
                                    MediaQuery.of(context).size.width * 0.13,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              singleMindfulnessExercise.name,
                              style: AppTextStyles.subtitleStyle,
                            ),
                            subtitle: Text(
                              singleMindfulnessExercise.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodyStyle.copyWith(
                                color:
                                    AppColors.primaryDarkBlue.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
