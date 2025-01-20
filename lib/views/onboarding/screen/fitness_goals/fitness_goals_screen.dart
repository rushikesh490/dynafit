import 'package:dynafit/core/constants/app_assets.dart';
import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/ui_components/common_check_box/common_check_box.dart';
import 'package:dynafit/ui_components/common_elevated_button/common_elevated_button.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:dynafit/views/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FitnessGoalsScreen extends StatelessWidget {
  FitnessGoalsScreen({super.key,required this.pageController,required this.onboardingCubit});

  final PageController pageController;
  final OnboardingCubit onboardingCubit;

  bool isDarkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  List<String> iconsList = [
    AppAssets.weight,
    AppAssets.aiCoach,
    AppAssets.bulk,
    AppAssets.endurance,
    AppAssets.mobile
  ];

  List<String> goalsList = [
    AppStrings.loseWeight,
    AppStrings.tryAICoach,
    AppStrings.getBulk,
    AppStrings.gainEndurance,
    AppStrings.tryingApp
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _verSpacer(100),
          _heading(context),
          _verSpacer(30),
          _goalsList(),
          _verSpacer(30),
          _continueButton()
        ],
      ),
    );
  }

  Widget _verSpacer(double value) => verSpacer(value);

  Widget _heading(var context) => SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        AppStrings.goalsTargets,
        style: AppTextStyles.bold24,
        textAlign: TextAlign.center,
      ));

  Widget _goalsList() => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: goalsList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              border: Border.all(
                  color: isDarkTheme(context)
                      ? AppColors.darkSubtext
                      : AppColors.darkYellow,
                  width: 0.5),
              borderRadius: BorderRadius.circular(8),
              gradient: isDarkTheme(context)
                  ? const LinearGradient(
                      colors: [
                          AppColors.shadowEffectBackgroundColor,
                          AppColors.lightText
                        ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(20))
                  : const LinearGradient(
                      colors: [AppColors.lightTab, AppColors.lightTab]),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(6, 6),
                    blurRadius: 12,
                    spreadRadius: 0,
                    color: isDarkTheme(context)
                        ? AppColors.darkCard.shade800
                        : AppColors.lightUpper),
              ]),
          child: Row(
            children: [
              SvgPicture.asset(
                iconsList[index],
                height: 18,
                width: 18,
                color: isDarkTheme(context)
                    ? AppColors.white
                    : AppColors.darkSubtext,
              ),
              horizontalSpacer(10),
              Text(
                goalsList[index],
                style: AppTextStyles.regular16,
              ),
              const Spacer(),
              CommonCheckBox(
                isCheck: false,
                callBack: () {},
              )
            ],
          ),
        );
      });

  Widget _continueButton() => CommonElevatedButton(
        onPressed: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        height: 63,
        text: AppStrings.kContinue,
        isValid: true,
      );
}
