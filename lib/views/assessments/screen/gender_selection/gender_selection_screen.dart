import 'package:dynafit/core/constants/app_assets.dart';
import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/ui_components/common_check_box/common_check_box.dart';
import 'package:dynafit/ui_components/common_elevated_button/common_elevated_button.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:flutter/material.dart';

class GenderSelectionScreen extends StatelessWidget {
  final PageController pageController;

  GenderSelectionScreen({super.key, required this.pageController});

  bool isDarkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  List<String> genderList = [
    AppStrings.male,
    AppStrings.female,
  ];

  int _cCurrentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _verSpacer(100),
          _heading(),
          _verSpacer(30),
          _genderList(),
          _verSpacer(30),
          _continueButton()
        ],
      ),
    );
  }

  Widget _verSpacer(double value) => verSpacer(value);

  Widget _heading() => Text(
        AppStrings.yourGender,
        style: AppTextStyles.bold24,
        textAlign: TextAlign.center,
      );

  Widget _genderList() => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: genderList.length,
      itemBuilder: (context, index) {
        return IntrinsicHeight(
          child: Stack(
            children: [
              Center(
                  child: Image.asset(
                genderList[index] == AppStrings.male
                    ? isDarkTheme(context)
                        ? AppAssets.darkMale
                        : AppAssets.male
                    : isDarkTheme(context)
                        ? AppAssets.darkFemale
                        : AppAssets.female,
                fit: BoxFit.fitWidth,
              )),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        genderList[index] == AppStrings.male
                            ? const Icon(
                                Icons.male,
                                color: AppColors.darkSubtext,
                              )
                            : const Icon(Icons.female,
                                color: AppColors.darkSubtext),
                        horizontalSpacer(10),
                        Text(
                          genderList[index],
                          style: AppTextStyles.regular16,
                        ),
                      ],
                    ),
                    const Spacer(),
                    CommonCheckBox(
                      isCheck: false,
                      callBack: () {},
                    )
                  ],
                ),
              ),
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
