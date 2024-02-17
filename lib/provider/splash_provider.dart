import 'dart:async';

import 'package:flutter/material.dart';

import '../views/authenticate/register.dart';


class SplashProvider extends ChangeNotifier{

  Timer? _timer;
  decideNavigation(){
    Navigator.of(context).
    push(MaterialPageRoute(builder: (context)=> const SignUp()));
  }


  updateNavigation(){
    _timer = Timer(const Duration(seconds: 5), decideNavigation);
    notifyListeners();
  }


}