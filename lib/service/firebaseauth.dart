import 'package:firebase_auth/firebase_auth.dart';

import '../models/specific_user.dart';
import 'package:flutter/material.dart';

class Authservice{

  //Initialising FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // bool accountCreated = false;

  // create specificuser obj based on User and a function as well
  SpecificUser? _specificUserfromUser(User? user){
    return user != null ? SpecificUser(uid: user.uid) : null;
  }

  //auth change user stream used to detect authentication changes
  Stream<SpecificUser?> get streamUser{
    return _auth.authStateChanges()
        .map(_specificUserfromUser);
  }

  // sign in anon
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _specificUserfromUser(user!);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerwithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _specificUserfromUser(user);

    } catch (e){
        print(e.toString());
        print('error');
        return null;
    }
  }


  //sign in with email and password
  Future signInwithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _specificUserfromUser(user);
    } catch (e){
      print(e.toString());
      print('error');
      return null;
    }
  }



  //Sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}
}