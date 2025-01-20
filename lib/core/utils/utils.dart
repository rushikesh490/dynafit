import 'package:dynafit/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Utilities {

  static void displayToast(BuildContext context, String message,
      {bool isError = false}) {

  }

  void showSnackBar(BuildContext context, {required String text, bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text,textAlign: TextAlign.center,),
        duration: const Duration(seconds: 2),
        backgroundColor: isError?AppColors.redBackground:AppColors.tootltipbg,
        margin: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.endToStart,
      ),
    );
  }

}