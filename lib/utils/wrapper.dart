import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repairhome/models/specific_user.dart';
import 'package:repairhome/service/firebaseauth.dart';
import 'package:repairhome/views/pages/authenticate/authenticate.dart';
import 'package:repairhome/views/pages/home/home.dart';

import '../views/pages/authenticate/register.dart';
import '../views/pages/authenticate/sign_in.dart';
class  Wrapper extends StatefulWidget {
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final Authservice _auth = Authservice();
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<SpecificUser?>(context);
    print(user);
    print("confirm");
    //Either returns Home widget or Authenticate widget

    if(user == null){
      return Authenticate();

    } else{
      return Home();
    }
  }

}
