import 'package:flutter/material.dart';
import 'package:repairhome/views/pages/authenticate/register.dart';
import 'package:repairhome/views/pages/authenticate/sign_in.dart';
import 'package:repairhome/views/pages/authenticate/sign_inanon.dart';
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
// For switching between signin page and register page
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}



