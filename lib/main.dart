import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repairhome/models/specific_user.dart';
import 'package:repairhome/service/firebaseauth.dart';
import 'package:repairhome/views/pages/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Provider used to allow the stream to be accessed in any part of the code
    return StreamProvider<SpecificUser?>.value(
      value: Authservice().streamUser,
      initialData: null,
      child: ChangeNotifierProvider(
        create: (BuildContext context) {  },
        child: MaterialApp(
            debugShowCheckedModeBanner : false,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}

