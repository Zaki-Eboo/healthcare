import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Login-Signup/components/toast.dart';
import 'package:medical/Screens/Login-Signup/login.dart';
import 'package:medical/Screens/Login-Signup/login_signup.dart';
import 'package:medical/Screens/Widgets/Auth_text_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../view/Utils/theme.dart';
import 'components/custombutton.dart';
import 'components/textformfield.dart';

class register extends StatefulWidget {
  register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool x = false;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> key_ = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon: Container(), onPressed: () {}),
        title: Text(
          "Sign up",
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
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 40),
                /*  Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.none,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        focusColor: Colors.black26,
                        fillColor: Color.fromARGB(255, 247, 247, 247),
                        filled: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Container(
                            child: Image.asset("assets/icons/person.png"),
                          ),
                        ),
                        prefixIconColor: const Color.fromARGB(255, 3, 190, 150),
                        label: Text(
                          "Enter your email",
                          style: GoogleFonts.poppins(fontSize: 15.sp),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Auth_text_field(
                  text: "Enter your name", icon: "assets/icons/email.png"),
              const SizedBox(
                height: 5,
              ),
              Auth_text_field(
                  text: "Enter your password", icon: "assets/icons/lock.png"),
                     */

                //==========================================================================================================
                //----------------------------------------------------- signUp
                //--------------------------------------------------------------
                Container(height: 20),
                const Text(
                  "Username",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18, color: g6),
                ),
                Container(height: 10),
                CustomTextForm(
                  hinttext: "ُEnter Your username",
                  mycontroller: username,
                  myValidator: (val) {
                    if (val == "") {
                      return "Can't empty field";
                    }
                  },
                ),
                Container(height: 20),
                const Text(
                  "Email",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18, color: g6),
                ),
                Container(height: 10),
                CustomTextForm(
                  hinttext: "ُEnter Your Email",
                  mycontroller: email,
                  myValidator: (val) {
                    if (val == "") {
                      return "Can't empty field";
                    }
                  },
                ),
                Container(height: 10),
                const Text(
                  "Password",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18, color: g6),
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
                //------------------------------------x
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: x,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            x = value;
                          });
                        }
                      },
                    ),
                    Text(
                      "I agree to the terms and conditions",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                //------------------------------------x
                //-------------------------------------------------- sign up
                //---------------------------------------------------------------
                Container(height: 10),
                /* CustomButton(
                  title: "Create account",
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/s1", (route) => false);
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Login()),
                      // );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                    //2
                  },
                ), */

////////////////////////////////////////////// abo Hamza
                CustomButton(
                  title: "SignUp",
                  onPressed: () async {
                    if (key_.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );

                        FirebaseAuth.instance.currentUser!
                            .sendEmailVerification();
                        toast(context,
                            text: "please verified your email and login");
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil("/s1", (route) => false);
                        ;

                        //-----------------
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          toast(context,
                              text: "The password provided is too weak");
                        } else if (e.code == 'email-already-in-use') {
                          toast(context,
                              text:
                                  "The account already exists for that email");
                        }
                      } catch (e) {
                        toast(context, text: "$e");
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Colors.black87),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: login()));
                      },
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 3, 190, 150),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
