import 'package:dynafit/core/constants/app_assets.dart';
import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/ui_components/ver_spacer/ver_spacer.dart';
import 'package:dynafit/views/account/view/account_screen.dart';
import 'package:dynafit/views/dashboard/cubit/dashboard_cubit.dart';
import 'package:dynafit/views/dashboard/widgets/bottom_navigation_bar.dart';
import 'package:dynafit/views/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardCubit _dashboardCubit;

  @override
  void initState() {
    super.initState();
    _dashboardCubit = context.read<DashboardCubit>();
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<DashboardCubit, DashboardState>(
          builder: _builder, listener: _listener);

  void _listener(BuildContext context, DashboardState state) {
    if (state is DashboardBottomNavigationToggle) {
      _dashboardCubit.selectedBottomNavigationIndex = state.selectedIndex;
    }
  }

  Widget _builder(BuildContext context, DashboardState state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _headerSection(context),
              _verSpacer(20),
              _dashboardCubit.selectedBottomNavigationIndex == 0
                  ? const HomeScreen()
                  :_dashboardCubit.selectedBottomNavigationIndex == 3?
                  const AccountScreen():
              Container()
            ],
          ),
        ),
        bottomNavigationBar: bottomNavigationBar(_dashboardCubit),
      );

  Widget _headerSection(var context) => Container(
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
}
