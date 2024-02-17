import 'package:flutter/material.dart';

import '../../../service/firebaseauth.dart';
class SignInAnon extends StatefulWidget {
  const SignInAnon({Key? key}) : super(key: key);

  @override
  State<SignInAnon> createState() => _SignInAnonState();
}

class _SignInAnonState extends State<SignInAnon> {

  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: ElevatedButton(
            //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Text('Sign in anon'),
              onPressed: () async{
                dynamic result = await _auth.signInAnon();
                if (result == null){
                  print("error signing in");
                }else {
                  print('signed in');
                  print(result.uid);
                }
              },
          ),
        ),
      ),
    );
  }
}
