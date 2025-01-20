import 'package:dynafit/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CommonSwitch extends StatelessWidget {
  final Function onChange;
  final bool value;
  const CommonSwitch({super.key, required this.onChange, required this.value});

  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: (values){
        onChange();
      },
      activeColor: AppColors.orange,
      inactiveThumbColor: AppColors.darkSubtext,
      value: value,
      trackOutlineColor: MaterialStateProperty. resolveWith<Color?>((Set<MaterialState> states) {
        if (states. contains(MaterialState. disabled)) {
          return Colors.transparent;
        }
        return Colors.transparent; // Use the default color.
      }),
      trackColor:  MaterialStateProperty. resolveWith<Color>((Set<MaterialState> states) {
        if (states. contains(MaterialState. disabled)) {
          return AppColors.red;
        }
        return AppColors.darkCard.shade300;
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
