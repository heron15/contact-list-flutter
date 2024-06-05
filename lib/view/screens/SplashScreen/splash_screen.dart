import 'package:contact_list/utils/app_route.dart';
import 'package:contact_list/utils/asset_paths.dart';
import 'package:contact_list/view/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 3));
    if(mounted){
      Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: SvgPicture.asset(
            AssetPaths.transAppLogo,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
