import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/core/routes/app_routes.dart';
import 'package:dynafit/ui_components/common_textfield/common_text_field.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {

  bool isDarkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:isDarkTheme(context)?AppColors.darkCard.shade600:AppColors.lightUpper ,
          elevation: 2,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
          title: Text(AppStrings.personalInformation,style: AppTextStyles.semiBold18,),
    ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.18,
                    width: MediaQuery.of(context).size.width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: AppColors.darkSubtext
                    ),
                  ),
                ],
              ),
              _verSpacer(10),
              CommonTextField(
                enabled: false,
                controller: TextEditingController(),
                hintText: AppStrings.enterYourEmail,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _verSpacer(double value) => verSpacer(value);

}
