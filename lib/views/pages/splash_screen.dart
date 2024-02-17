import 'dart:async';

import 'package:flutter/material.dart';
import 'package:repairhome/utils/wrapper.dart';
import 'package:repairhome/views/widgets/app_images.dart';

import '../widgets/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  // For the timer, to know the number of period the splash screen would be active
  _startDelay(){
    _timer = Timer(const Duration(seconds: 5), decideNavigation);
  }

  //To decide the next page to move after the splashscreen
  decideNavigation(){
    Navigator.of(context).
    push(MaterialPageRoute(builder: (context)=> Wrapper()));
}
  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.indigo,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            Image.asset(AppImages.LOGO, width: 150,),
            ]
          ),
        ),

    );
  }
}
