import 'package:dynafit/core/constants/app_assets.dart';
import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:dynafit/views/dashboard/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> imagesList = [
  AppAssets.platesExcercise,
  AppAssets.dumbbellExcercise,
  AppAssets.skippingExcercise,
  AppAssets.yogaExcercise,
];

List<String> descriptionsList = [
  AppStrings.dynamicStretching,
  AppStrings.bodyMuscular,
  AppStrings.loseWeight,
  AppStrings.yogaDescription,
];

List<String> titleList = [
  AppStrings.stretching,
  AppStrings.bodyBuilding,
  AppStrings.skipping,
  AppStrings.yoga,
];

bool isDarkTheme(BuildContext context) {
  final theme = Theme.of(context);
  return theme.brightness == Brightness.dark;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _verSpacer(20),
          _workoutsSection(),
          _verSpacer(10),
          _dietSection()
        ],
      ),
    );
  }

  Widget _verSpacer(double value) => verSpacer(value);

  Widget _workoutsSection() => Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.workouts,
          style: AppTextStyles.semiBold16,
        ),
        _verSpacer(10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              imagesList.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.darkSubtext,
                        width: 0.5
                      ),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(right: 8), // Spacing between items
                child: Column(
                  children: [
                    Stack(
                      children: [
                    
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 130,
                            width: 200,
                            decoration: BoxDecoration(
                              color: AppColors.lightUpper,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Image.asset(imagesList[index]),
                      ],
                    ),
                    _verSpacer(10),
                    Text(titleList[index],style: AppTextStyles.semiBold14,),
                    SizedBox(
                      width: 150,
                        child: Text(descriptionsList[index],style: AppTextStyles.regular12,textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _dietSection() => Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.dietAndNutrition,
          style: AppTextStyles.semiBold16,
        ),
        _verSpacer(10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              imagesList.length,
                  (index) => Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.darkSubtext,
                        width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(8)
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(right: 8), // Spacing between items
                child: Column(
                  children: [
                    Stack(
                      children: [

                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 130,
                            width: 200,
                            decoration: BoxDecoration(
                                color: AppColors.lightUpper,
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Image.asset(imagesList[index]),
                      ],
                    ),
                    _verSpacer(10),
                    Text(titleList[index],style: AppTextStyles.semiBold14,),
                    SizedBox(
                        width: 150,
                        child: Text(descriptionsList[index],style: AppTextStyles.regular12,textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );

}
