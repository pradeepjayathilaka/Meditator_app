import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditator_app/models/mindfull_exercise_mdel.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/providers/filter_provider.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<FilterProvider>(context, listen: false)
              .getData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Error Loading data"),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error Loading data"),
              );
            }
            return Consumer<FilterProvider>(
              builder: (context, filterData, child) {
                final completedData = filterData.filterData;
                completedData.shuffle();
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/meditation.png",
                              width: MediaQuery.of(context).size.width * 0.09,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Meditator",
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryPurple,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Select category to start exploring!",
                          style: AppTextStyles.subtitleStyle.copyWith(
                            color: AppColors.primaryDarkBlue,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryPurple.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  FilterChip(
                                    label: Text(
                                      "All",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "All"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("All");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "All",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Mindfulness",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Mindfulness"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Mindfulness");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "Mindfulness",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Meditation",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Meditation"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Meditation");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "Meditation",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Sleep Stories",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Sleep Stories"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Sleep Stories");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "Sleep Stories",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (completedData.isNotEmpty)
                          StaggeredGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: completedData.map((data) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: data is MindfulnessExercise
                                        ? AppColors.primaryGreen
                                        : data is SleepExercise
                                            ? AppColors.primaryPurple
                                            : AppColors.primaryDarkBlue
                                                .withOpacity(0.6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.name,
                                          style:
                                              AppTextStyles.titleStyle.copyWith(
                                            color: AppColors.primaryWhite,
                                          ),
                                        ),
                                        Text(
                                          data.category,
                                          style: AppTextStyles.bodyStyle
                                              .copyWith(
                                                  color: AppColors.primaryBlack
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${data.duration} min",
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryBlack
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                        Text(
                                          data.description,
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryWhite,
                                          ),
                                          maxLines:
                                              (data.description.length / 2)
                                                  .toInt(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
