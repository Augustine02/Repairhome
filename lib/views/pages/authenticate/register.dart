import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:repairhome/constants/textinput_decoration.dart';
import 'package:repairhome/shared/loading.dart';
import 'package:repairhome/views/pages/authenticate/authenticate.dart';
import 'package:repairhome/views/pages/authenticate/sign_in.dart';
import '../../../constants/button_decoration.dart';
import '../../../service/firebaseauth.dart';
import '../../widgets/app_images.dart';
class Register extends StatefulWidget {

// For switching between signin page and register page
   final Function toggleView;
   Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();

}

class _RegisterState extends State<Register> {

  final Authservice _auth = Authservice();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }
  //For using controller method
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // final createpasswordController = TextEditingController();

  //text field state
  //For using onpressed method
  String email = '';
  String password = '';
  String confirmPassword = '';
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
                    image: AssetImage(AppImages.HALF2_ICON, ),//Image.asset(AppImages.HALF_ICON, width: 250, ),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Image.asset(AppImages.HALF_ICON, width: 250, ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 50, 24, 15),
                      child: Image.asset(AppImages.BLUE_ICON, width: 250, ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                                "Create new account",
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
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'Confirm password'),
                              obscureText: true,
                              validator: (val) => val! != password ? 'Password does not match' : null,
                              // controller: createpasswordController,
                              onChanged: (val) {
                                setState(() => confirmPassword = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              //backgroundColor: Colors.pink[400];
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0,

                                ),
                              ),
                              onPressed: () async{
                                if(_formkey.currentState!.validate()) {
                                  setState(() => loading = true);
                                  dynamic result = await _auth
                                      .registerwithEmailAndPassword(
                                      email.trim(), password);
                                  print(result);

                                  if (result == null) {
                                    setState(() {
                                      error = 'please supply a valid email';
                                      loading = false;
                                    });
                                  } else {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                            SignIn(toggleView: toggleView)));
                                    super.dispose();
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
                                "- or sign up with -",
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
                              children: [

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

                            SizedBox(height: 20),

                            Center(
                              child: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Have an account? ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black26,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " Sign in",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue[900],
                                          ),

                                          recognizer: TapGestureRecognizer()
                                            ..onTap = (){
                                            setState(() {
                                              widget.toggleView();
                                            });

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

