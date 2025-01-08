import 'package:flutter/material.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                          label: const Text("All"),
                          onSelected: (value) {},
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        FilterChip(
                          label: const Text("Mindfulness"),
                          onSelected: (value) {},
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        FilterChip(
                          label: const Text("Meditation"),
                          onSelected: (value) {},
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        FilterChip(
                          label: const Text("Sleep Stories"),
                          onSelected: (value) {},
                        ),
                      ],
                    ),
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
