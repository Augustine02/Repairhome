import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:repairhome/service/firebaseauth.dart';
import 'package:repairhome/shared/loading.dart';
import 'package:repairhome/utils/wrapper.dart';
import '../../../constants/button_decoration.dart';
import '../../../constants/textinput_decoration.dart';
import '../../widgets/app_images.dart';
import '../home/home.dart';

class SignIn extends StatefulWidget {

  // For switching between signin page and register page
   final Function toggleView;
   SignIn({required this.toggleView});

  // const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final Authservice _auth = Authservice();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();


  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
            key: _formkey,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment(0, -1.3),
                  image: AssetImage(AppImages.HALF_ICON),//Image.asset(AppImages.HALF_ICON, width: 250, ),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Image.asset(AppImages.HALF_ICON, width: 250, ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 70, 24, 15),
                      child: Image.asset(AppImages.BLUE_ICON, width: 250, ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                "Login to your account",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,

                                )
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'Email'),
                              validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                              // controller: emailController,
                              onChanged: (val) {
                                setState(() => email = val);
                              },

                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'Password'),
                              obscureText: true,
                              validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                              // controller: passwordController,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              //backgroundColor: Colors.pink[400];
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0,

                                ),
                              ),
                              onPressed: () async {
                                 if(_formkey.currentState!.validate()) {
                                   setState(() => loading = true);
                                   dynamic result = await _auth.signInwithEmailAndPassword(
                                       email.trim(), password);

                                   if(result == null){
                                     setState((){
                                       error = 'Could not sign in with those credentials';
                                       loading = false;
                                     });
                                   }if(result != null){
                                      Navigator.of(context).push(
                                         MaterialPageRoute(builder: (context) =>
                                             Wrapper()));
                                   }


                                 }

                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 130.0)),
                                elevation: MaterialStateProperty.all(10.0),
                                shadowColor: MaterialStateProperty.all(Colors.black) ,
                              ),

                            ),

                            SizedBox(height: 10,),
                            Text(
                              error,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.0,

                              ),
                            ),

                            SizedBox(height: 30),
                            const Center(
                              child: Text(
                                "- or sign in with -",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[

                                ElevatedButton(
                                    onPressed: () {  },
                                    style: buttonDecoration,
                                    child: Image.asset(
                                      AppImages.GOOGLE_ICON,
                                      width: 100, height: 50,
                                    )

                                ),
                                SizedBox(width: 15),
                                ElevatedButton(
                                    style: buttonDecoration,
                                    onPressed: () {  },
                                    child: Image.asset(
                                      AppImages.FACEBOOK_ICON,
                                      width: 100, height: 50,
                                    )),
                                SizedBox(width: 15),
                                ElevatedButton(
                                    style: buttonDecoration,
                                    onPressed: () {  },
                                    child: Image.asset(
                                        AppImages.TWITTER_ICON,
                                        width: 100, height: 50)),
                              ]
                              ,
                            ),

                            SizedBox(height: 50),

                            Center(
                              child: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Don't have an account? ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black26,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " Sign up",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue[900],
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = (){
                                              widget.toggleView();
                                            },
                                        ),

                                      ]
                                  ) ),
                            ),

                          ],
                        ),
                      ),
                    ),



                    // actions: <Widget> [
                    //   TextButton.icon(
                    //     onPressed: (){
                    //       widget.toggleView();
                    //     },
                    //     icon: Icon(Icons.person),
                    //     label: Text('Register'),
                    //   )
                    //],

                  ]

              ),


            ),
          )
      ),
    );
  }
}
