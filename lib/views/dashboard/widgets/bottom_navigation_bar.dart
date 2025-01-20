import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/views/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';

Widget bottomNavigationBar (DashboardCubit dashboardCubit) => BottomNavigationBar(
    backgroundColor: AppColors.darkCard.shade900,
    unselectedItemColor: AppColors.darkSubtext,
    type: BottomNavigationBarType.fixed,
    selectedFontSize: 12,
    unselectedFontSize: 12,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: (index){
      dashboardCubit.selectBottomNavigation(index);
    },
    currentIndex: dashboardCubit.selectedBottomNavigationIndex,
    iconSize: 18,
    selectedItemColor: AppColors.orange,
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: AppColors.darkCard.shade600
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts),
          label: "Workouts",
          backgroundColor: AppColors.darkCard.shade600
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.fastfood_rounded),
          label: "Diets",
          backgroundColor: AppColors.darkCard.shade600
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
          backgroundColor: AppColors.darkCard.shade600
      )
    ]
);