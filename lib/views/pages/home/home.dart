import 'package:flutter/material.dart';
import 'package:repairhome/service/firebaseauth.dart';

class Home extends StatelessWidget {
  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget> [
          TextButton.icon(
              onPressed: ()async{
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout'),
          )
        ],
      ),
    );
  }
}

