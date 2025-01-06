import 'package:dynafit/core/constants/app_assets.dart';
import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_strings.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [_headerSection(), _verSpacer(20), _activitySection()],
        ),
      ),
    );
  }

  Widget _headerSection() => Container(
        // height: MediaQuery.of(context).size.height*0.3,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            color: AppColors.darkCard.shade900),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                  color: AppColors.darkCard.shade300,
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              width: 210,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "8 Oct 1998",
                    style: AppTextStyles.regular12
                        .copyWith(color: AppColors.darkSubtext),
                  ),
                  Text(
                    "Hello, Rishi!",
                    style: AppTextStyles.semiBold16
                        .copyWith(color: AppColors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.weight,
                            color: AppColors.darkSubtext,
                            height: 12,
                          ),
                          horizontalSpacer(4),
                          Text(
                            "56 weight",
                            style: AppTextStyles.regular12
                                .copyWith(color: AppColors.darkSubtext),
                          ),
                        ],
                      ),
                      horizontalSpacer(10),
                      Row(
                        children: [
                          const Icon(
                            Icons.man,
                            color: AppColors.darkSubtext,
                            size: 12,
                          ),
                          horizontalSpacer(4),
                          Text(
                            "27 age",
                            style: AppTextStyles.regular12
                                .copyWith(color: AppColors.darkSubtext),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                  color: AppColors.darkCard.shade300,
                  borderRadius: BorderRadius.circular(8)),
            )
          ],
        ),
      );

  Widget _verSpacer(double value) => verSpacer(value);

  Widget _activitySection() => Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.activities,
          style: AppTextStyles.semiBold16,
        ),
        _verSpacer(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              6,
                  (index) => Container(
                margin: const EdgeInsets.only(right: 8), // Spacing between items
                height: 30, // Dynamic content height
                width: 60,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    ),
  );

}
