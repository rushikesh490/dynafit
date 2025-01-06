import 'package:dynafit/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonCheckBox extends StatelessWidget {
  bool isCheck;
  Function callBack;



  CommonCheckBox({super.key,required this.isCheck,required this.callBack});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDarkTheme = theme.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            isCheck = !isCheck;
            callBack(isCheck);
          },
          child: Container(


            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: isDarkTheme
                    ? [
                  AppColors.darkInput,
                  AppColors.darkInput,
                ]
                    : [
                  AppColors.lightShadow1.withOpacity(0.7),
                  AppColors.white.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.2, 0.7],
              ),
              border: Border.all(
                color:   AppColors.darkYellow,
                width: isDarkTheme ?0.4:1,
              ),
            ),
            child: isCheck? Center(child: Icon(Icons.check,color: isDarkTheme ? AppColors.darkYellow : AppColors.darkCard,)) : const SizedBox(),
          ),
        ),

      ],
    );
  }
}