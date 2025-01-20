import 'package:dynafit/core/app_theme/app_theme_cubit.dart';
import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/core/routes/app_routes.dart';
import 'package:dynafit/ui_components/common_switch/common_switch.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
                child: Text(AppStrings.general,style: AppTextStyles.semiBold14,)),
            _verSpacer(10),
            _perSonalInfo(),
            _themeChange(),
            _verSpacer(10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.help,style: AppTextStyles.semiBold14,)),
            _verSpacer(10),
            _help(),
            _privacyPolicy(),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.logout,style: AppTextStyles.semiBold14,)),
            _verSpacer(10),
            _logout()
          ],
        ),
      ),
    );
  }

  Widget _verSpacer(double value) => verSpacer(value);

  Widget _perSonalInfo() => _commonBox(const Icon(Icons.account_box_outlined,size: 16,),AppStrings.personalInformation,(){
    context.push(AppRoutes.personalInformation);
  });

  Widget _themeChange() => BlocBuilder<AppThemeCubit, AppThemeState>(
  builder: (context, state) {
    final isDarkMode = state.themeData.brightness == Brightness.dark;
    return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: isDarkTheme(context)
            ? const LinearGradient(
            colors: [
              AppColors.shadowEffectBackgroundColor,
              AppColors.lightText
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            transform: GradientRotation(20))
            : const LinearGradient(
            colors: [AppColors.lightTab, AppColors.lightTab]),
        boxShadow: [
          BoxShadow(
              offset: const Offset(6, 6),
              blurRadius: 12,
              spreadRadius: 0,
              color: isDarkTheme(context)
                  ? AppColors.darkCard.shade800
                  : AppColors.lightUpper),
        ],
        border: Border.all(
            color: AppColors.darkSubtext,
            width: 0.5
        )
    ),
    child: Row(
      children: [
        Row(
          children: [
            const Icon(Icons.shield_moon_rounded),
            horizontalSpacer(5),
            Text(AppStrings.darkTheme,style: AppTextStyles.regular14,),
          ],
        ),
        const Spacer(),
        CommonSwitch(onChange:()=> context.read<AppThemeCubit>().toggleTheme(!isDarkMode) ,value: isDarkMode?true:false,)
      ],
    ),
  );
  },
);

  Widget _help() => _commonBox(const Icon(Icons.help,size: 16,),AppStrings.help,(){});

  Widget _privacyPolicy() => _commonBox(const Icon(Icons.privacy_tip,size: 16,),AppStrings.privacyPolicy,(){});

  Widget _logout() => _commonBox(const Icon(Icons.logout,size: 16,),AppStrings.signOut,(){},titleColor: AppColors.red);

  Widget _commonBox(Icon icon,String title,Function onTap,{Color? titleColor}) => GestureDetector(
    onTap: ()=> onTap(),
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: isDarkTheme(context)
              ? const LinearGradient(
              colors: [
                AppColors.shadowEffectBackgroundColor,
                AppColors.lightText
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              transform: GradientRotation(20))
              : const LinearGradient(
              colors: [AppColors.lightTab, AppColors.lightTab]),
          boxShadow: [
            BoxShadow(
                offset: const Offset(6, 6),
                blurRadius: 12,
                spreadRadius: 0,
                color: isDarkTheme(context)
                    ? AppColors.darkCard.shade800
                    : AppColors.lightUpper),
          ],
          border: Border.all(
              color: AppColors.darkSubtext,
              width: 0.5
          )
      ),
      child: Row(
        children: [
          Row(
            children: [
              icon,
              horizontalSpacer(5),
              Text(title,style: AppTextStyles.regular14.copyWith(color: titleColor),),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: ()=>onTap(), icon: const Icon(Icons.arrow_forward))
        ],
      ),
    ),
  );



}
