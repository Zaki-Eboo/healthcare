import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical/Screens/Login-Signup/components/custombutton.dart';
import 'package:medical/Screens/Login-Signup/components/textformfield.dart';
import 'package:medical/Screens/Login-Signup/components/toast.dart';
import 'package:medical/Screens/Login-Signup/forgot_pass.dart';
import 'package:medical/Screens/Login-Signup/login_signup.dart';
import 'package:medical/Screens/Login-Signup/register.dart';
import 'package:medical/Screens/Views/Homepage.dart';
import 'package:medical/Screens/Widgets/Auth_text_field.dart';
import 'package:medical/Screens/Widgets/auth_social_login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> key_ = GlobalKey<FormState>();
//------------------------------------------------------------sign with google
//------------------------------------------------------------------------------
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
//5
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon: Container(), onPressed: () {}),
        centerTitle: true,
        title: Text(
          "Login",
          style: GoogleFonts.inter(
              color: Colors.black87,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0),
        ),
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: key_,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //================================================================== Abo Hamza

              //------------------------------------------------------- Email
              //--------------------------------------------------------------

              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(height: 10),
              CustomTextForm(
                hinttext: "Enter Your Email",
                mycontroller: email,
                myValidator: (val) {
                  if (val == "") {
                    return "Can't empty field";
                  }
                },
              ),
              //---------------------------------------------------- password
              //--------------------------------------------------------------
              Container(height: 10),
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(height: 10),
              CustomTextForm(
                hinttext: "ُEnter Your Password",
                mycontroller: password,
                myValidator: (val) {
                  if (val == "") {
                    return "Can't empty field";
                  }
                },
              ),

              //----------------------------------------------------------- login
              //------------------------------------------------------------------
              Container(height: 40),
              /*        CustomButton(
                title: "login",
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email.text, password: password.text);
                    //pass if the user enter correct password
                    //-----------------------------------------------------
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                },
                            ), */
              CustomButton(
                title: "login",
                onPressed: () async {
                  if (key_.currentState!.validate()) {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );

                      if (credential.user!.emailVerified) {
                        //pass if the user enter correct password
                        //-----------------------------------------------------
                      } else {
                        toast(context, text: "please verified your email");
                        FirebaseAuth.instance.currentUser!
                            .sendEmailVerification();
                      }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                      //--------------------------
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        toast(context, text: "No user found for that email");
                      } else if (e.code == 'wrong-password') {
                        toast(context,
                            text: "Wrong password provided for that user");
                      }
                    }
                  }
                },
              ),

              //------------------------------------------ Forgot your password?
              //------------------------------------------------------------------
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: forgot_pass(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot your password?",
                      style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: const Color.fromARGB(255, 3, 190, 150),
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),

              //---------------------------------------------------  sign up
              //------------------------------------------------------------------
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.poppins(
                        fontSize: 15.sp, color: Colors.black87),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: register()));
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        color: const Color.fromARGB(255, 3, 190, 150),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              //----------------------------------------------------------------------------- or
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "or",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              //----------------------------------------------  sign with google
              //------------------------------------------------------------------

              const SizedBox(
                height: 30,
              ),

              GestureDetector(
                onTap: () async {
                  signInWithGoogle();
                },
                child: auth_social_logins(
                    logo: "assets/images/google.png",
                    text: "Sign in with Google"),
              ),
              const SizedBox(
                height: 20,
              ),
              auth_social_logins(
                  logo: "assets/images/apple.png", text: "Sign in Apple"),
              const SizedBox(
                height: 20,
              ),
              auth_social_logins(
                  logo: "assets/images/facebook.png", text: "Sign in facebook")
            ]),
          ),
        ),
      ),
    );
  }
}
