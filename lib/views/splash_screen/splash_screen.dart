import 'package:dynafit/core/constants/app_assets.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:dynafit/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),() {
      context.go(AppRoutes.signIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Image.asset(AppAssets.dynaFitLogo,height: MediaQuery.of(context).size.height*0.6,width: MediaQuery.of(context).size.width*0.4,),
                Text(
                  "Dynafit",
                  style: AppTextStyles.bold20.copyWith(fontSize: 50),
                ),
              ],
            ),
          )),
    );
  }
}
