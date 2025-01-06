import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final Color textColor;
  final Color? buttonColor;
  final bool? isValid;
  final double? height;
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;
  final TextStyle? style;

  const CommonElevatedButton({
    this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.isValid,
    this.height,
    this.leftMargin,
    this.rightMargin,
    this.topMargin,
    this.bottomMargin,
    this.style,
    this.child,
    this.buttonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final isDarkTheme = theme.brightness == Brightness.dark; // Determine theme brightness

    return Container(
      height: height,
      margin: EdgeInsets.only(
        left: leftMargin ?? 0.0,
        right: rightMargin ?? 0.0,
        top: topMargin ?? 0.0,
        bottom: bottomMargin ?? 0.0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Colors.transparent, // Default transparent background
          shadowColor: isDarkTheme
              ? AppColors.darkCard.shade700
              : Colors.transparent, // Adjust shadow based on theme
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.zero, // Removes default padding
        ),
        onPressed: isValid ?? false ? onPressed : null,
        child: child ??
            Ink(
              decoration: BoxDecoration(
                gradient:
                isDarkTheme
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
              ),
              child: Container(
                height: height,
                alignment: Alignment.center,
                child: Text(
                  text ?? '',
                  style: style ??
                      AppTextStyles.bold20.copyWith(
                        color:  isDarkTheme
                            ? AppColors.darkCard.shade900
                            : AppColors.lightCard.shade50,
                      ),
                ),
              ),
            ),
      ),
    );
  }
}