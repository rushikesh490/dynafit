import 'package:dynafit/core/constants/app_assets.dart';
import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/core/routes/app_routes.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FitnessExperienceScreen extends StatefulWidget {
  final PageController pageController;

  const FitnessExperienceScreen({super.key, required this.pageController});

  @override
  State<FitnessExperienceScreen> createState() =>
      _FitnessExperienceScreenState();
}

class _FitnessExperienceScreenState extends State<FitnessExperienceScreen> {
  bool isDarkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _verSpacer(100),
          _heading(),
          _verSpacer(30),
          _image(),
          _verSpacer(30),
          _yesNoButtons()
        ],
      ),
    );
  }

  Widget _verSpacer(double value) => verSpacer(value);

  Widget _heading() => Text(
        AppStrings.fitnessExperience,
        style: AppTextStyles.bold24,
        textAlign: TextAlign.center,
      );

  _image() => Image.asset(isDarkTheme(context)
      ? AppAssets.fitnessExperienceDark
      : AppAssets.fitnessExperience);

  _yesNoButtons() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              context.push(AppRoutes.home);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  gradient: isDarkTheme(context)
                      ? LinearGradient(colors: [
                          AppColors.darkPrimary,
                          AppColors.darkPrimary,
                          AppColors.darkCard.shade400,
                        ])
                      : LinearGradient(colors: [
                          AppColors.darkCard.shade600,
                          AppColors.darkCard.shade500,
                          AppColors.darkCard.shade400,
                        ]),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(6, 6),
                        blurRadius: 12,
                        spreadRadius: 0,
                        color: isDarkTheme(context)
                            ? AppColors.darkCard.shade800
                            : AppColors.lightShadow1),
                    BoxShadow(
                        offset: const Offset(6, 6),
                        blurRadius: 12,
                        spreadRadius: 0,
                        color: isDarkTheme(context)
                            ? AppColors.darkCard.shade500
                            : AppColors.white.withOpacity(0.3))
                  ]),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      AppStrings.no,
                      style: AppTextStyles.regular14.copyWith(
                          color: isDarkTheme(context)
                              ? AppColors.darkCard.shade900
                              : AppColors.white),
                    ),
                    horizontalSpacer(10),
                    Icon(
                      Icons.dangerous,
                      color: isDarkTheme(context)
                          ? AppColors.darkCard.shade900
                          : AppColors.white,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
          ),
          horizontalSpacer(20),
          GestureDetector(
            onTap: (){
              context.push(AppRoutes.home);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  gradient: isDarkTheme(context)
                      ? LinearGradient(colors: [
                    AppColors.darkPrimary,
                    AppColors.darkPrimary,
                    AppColors.darkCard.shade400,
                  ])
                      : LinearGradient(colors: [
                    AppColors.darkCard.shade600,
                    AppColors.darkCard.shade500,
                    AppColors.darkCard.shade400,
                  ]),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(6, 6),
                        blurRadius: 12,
                        spreadRadius: 0,
                        color: isDarkTheme(context)
                            ? AppColors.darkCard.shade800
                            : AppColors.lightShadow1),
                    BoxShadow(
                        offset: const Offset(6, 6),
                        blurRadius: 12,
                        spreadRadius: 0,
                        color: isDarkTheme(context)
                            ? AppColors.darkCard.shade500
                            : AppColors.white.withOpacity(0.3))
                  ]),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      AppStrings.yes,
                      style: AppTextStyles.regular14.copyWith(
                          color: isDarkTheme(context)
                              ? AppColors.darkCard.shade900
                              : AppColors.white),
                    ),
                    horizontalSpacer(10),
                    Icon(
                      Icons.check,
                      color: isDarkTheme(context)
                          ? AppColors.darkCard.shade900
                          : AppColors.white,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
}
