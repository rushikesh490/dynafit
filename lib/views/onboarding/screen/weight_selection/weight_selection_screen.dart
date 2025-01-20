import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/ui_components/common_elevated_button/common_elevated_button.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

class WeightSelectionScreen extends StatefulWidget {
  final PageController pageController;

  const WeightSelectionScreen({super.key,required this.pageController});

  @override
  State<WeightSelectionScreen> createState() => _WeightSelectionScreenState();
}

class _WeightSelectionScreenState extends State<WeightSelectionScreen> {

  late FixedExtentScrollController _controller;

  final int minValue = 15; // Minimum value
  final int maxValue = 100; // Maximum value
  int _currentValue = 20; // Initial value (must be an integer)

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(
      initialItem: _currentValue - minValue, // Map initial value to range
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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
          _weightSelectScroll(),
          _verSpacer(30),
          _continueButton()
        ],
      ),
    );
  }

  Widget _verSpacer(double value) => verSpacer(value);

  Widget _heading() => Text(
    AppStrings.yourWeight,
    style: AppTextStyles.bold24,
    textAlign: TextAlign.center,
  );

  Widget _weightSelectScroll() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Display the current value
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_currentValue ',
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              'kg',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

          ],
        ),
        horizontalSpacer(16),
        // The WheelSlider
        SizedBox(
          height: 200,
          child: WheelSlider(
            totalCount: maxValue - minValue + 1, // Adjust the count for the range
            initValue: _currentValue - minValue, // Map initValue to the range
            controller: _controller,
            squeeze: 0.6,
            lineColor: AppColors.darkSubtext,
            pointerHeight: 80,
            pointerWidth: 20,
            pointerColor: Colors.transparent,
            isVibrate: false,
            onValueChanged: (val) {
              setState(() {
                _currentValue = val + minValue;
              });
            },
            hapticFeedbackType: HapticFeedbackType.vibrate,
            customPointer: Container(
              height: 80,
              width: 10,
              decoration: const BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8),bottom: Radius.circular(4)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3), // Optional: Add a shadow for depth
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


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
