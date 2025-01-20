import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/ui_components/common_elevated_button/common_elevated_button.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:flutter/material.dart';

class AgeSelectionScreen extends StatefulWidget {
  final PageController pageController;

  AgeSelectionScreen({super.key,required this.pageController});


  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  int _selectedWeight = 18;

  final FixedExtentScrollController _scrollController = FixedExtentScrollController(initialItem: 7);

  void _printWeight() {
    print('Selected weight: $_selectedWeight');
  }

  bool isDarkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          _ageSelectScroll(),
          _verSpacer(30),
          _continueButton()
        ],
      ),
    );
  }

  Widget _verSpacer(double value) => verSpacer(value);

  Widget _heading() => Text(
    AppStrings.yourAge,
    style: AppTextStyles.bold24,
    textAlign: TextAlign.center,
  );

  Widget _ageSelectScroll() => SizedBox(
    height: MediaQuery.of(context).size.height*0.6,
    width: MediaQuery.of(context).size.width*0.9,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListWheelScrollView.useDelegate(
        controller: _scrollController,
        itemExtent: 120, // Height of each item
        squeeze: 0.9, // Adjusts the spacing between items
        onSelectedItemChanged: (index) {
          // Update selected weight when the index changes
          setState(() {
            _selectedWeight = 18+index;
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final weight = 18 + index;
            // Check if the current weight is the selected one
            final isSelected = _selectedWeight == weight;
            return Container(
              decoration: BoxDecoration(
                color:isSelected? Colors.black:AppColors.darkSubtext,
                borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(6, 6),
                        blurRadius: 12,
                        spreadRadius: 0,
                        color: isDarkTheme(context)
                            ? AppColors.darkCard.shade800
                            : AppColors.darkPrimary),
                  ]
              ),
              child: Center(
                child: Text(
                  (18+ index).toString(),
                  style: AppTextStyles.bold24.copyWith(color: isSelected?Colors.white:Colors.black),
                ),
              ),
            );
          },
          childCount: 48, // We want a range from 0 to 150
        ),
      ),
    ),
  );

  Widget _continueButton() => CommonElevatedButton(
    onPressed: () {
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    },
    height: 63,
    text: AppStrings.kContinue,
    isValid: true,
  );

}
