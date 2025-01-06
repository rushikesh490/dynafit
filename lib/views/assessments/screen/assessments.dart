import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:dynafit/views/assessments/cubit/assessment_cubit.dart';
import 'package:dynafit/views/assessments/screen/age_selection/age_selection_screen.dart';
import 'package:dynafit/views/assessments/screen/fitness_experience/fitness_experience_screen.dart';
import 'package:dynafit/views/assessments/screen/fitness_goals/fitness_goals_screen.dart';
import 'package:dynafit/views/assessments/screen/gender_selection/gender_selection_screen.dart';
import 'package:dynafit/views/assessments/screen/weight_selection/weight_selection_screen.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Assessments extends StatefulWidget {
  const Assessments({super.key});

  @override
  State<Assessments> createState() => _AssessmentsState();
}

class _AssessmentsState extends State<Assessments> {

  late AssessmentCubit assessmentCubit;
  final PageController _pageController = PageController();
  int currentPage = 0;
  late List<Widget> pages;

  bool isDarkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  @override
  void initState() {
    super.initState();
    assessmentCubit = context.read<AssessmentCubit>();

    _pageController.addListener(() {
        assessmentCubit.changePage(_pageController.page?.round() ?? 0);
    });

    pages = [
      FitnessGoalsScreen(pageController: _pageController),
      GenderSelectionScreen(pageController: _pageController),
      WeightSelectionScreen(pageController: _pageController),
      AgeSelectionScreen(pageController: _pageController,), // Example for additional page
      FitnessExperienceScreen(pageController: _pageController,), // Example for additional page
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AssessmentCubit, AssessmentState>(
          builder: _builder, listener: _listener);

  void _listener(BuildContext context, AssessmentState state) {
    if (state is AssessmentPageChange) {
      print(state.count);
      currentPage = state.count;
    }
  }

  Widget _builder(BuildContext context, AssessmentState state) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                assessmentCubit.changePage(index);
              },
              children: pages,
            ),
            // Back button at top-left corner
            Positioned(
              top: 10,
              left: 10,
              child: Row(
                children: [
                  currentPage > 0?
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color:AppColors.darkSubtext,
                    onPressed: () {
                      if (currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ):const SizedBox(height: 25,),
                  horizontalSpacer(5),
                  Text(AppStrings.assessments,style: AppTextStyles.semiBold18,)
                ],
              ),
            ),
            // Current page index at top-right corner
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    color: isDarkTheme(context)
                        ? AppColors.darkCard.shade400.withOpacity(0.5)
                        : AppColors.lightInsideContainer,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color:
                            AppColors.darkYellow,
                        width:isDarkTheme(context)?0.4: 1),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(6, 6),
                          blurRadius: 12,
                          spreadRadius: 0,
                          color: isDarkTheme(context)
                              ? AppColors.darkCard.shade900
                              : AppColors.lightShadow1,
                          inset: true),
                      BoxShadow(
                          offset: const Offset(-6, -6),
                          blurRadius: 12,
                          spreadRadius: 0,
                          color: isDarkTheme(context)
                              ? const Color.fromRGBO(45, 65, 95, 0.2)
                              : AppColors.white.withOpacity(0.2),
                          inset: true)
                    ]),
                child: Text(
                  '${currentPage + 1}/${pages.length}',
                  style: AppTextStyles.regular14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
