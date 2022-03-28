import 'package:crudappmdp/Screens/decision.dart';
import 'package:crudappmdp/Screens/register.dart';
import 'package:crudappmdp/Screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignInScreen extends StatefulWidget {
  final Function(User?) onSignIn;
  const SignInScreen({Key? key, required this.onSignIn}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  loginWithEP() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
    widget.onSignIn(userCredential.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff000000),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(4.w),
              width: 40.w,
              height: 40.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage('img/logos.png'),
                      fit: BoxFit.fitHeight)),
              alignment: Alignment.center,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.w, horizontal: 8.w),
                      alignment: Alignment.centerLeft,
                      child: Text('Sign In',
                          style: GoogleFonts.ubuntu(
                              fontSize: 24.dp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffffffff))),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.w, horizontal: 8.w),
                      alignment: Alignment.centerLeft,
                      child: Text('Sign in with your account',
                          style: GoogleFonts.ubuntu(
                              fontSize: 11.dp,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xffffffff))),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.w),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: const Color(0xff000000),
                        style: GoogleFonts.ubuntu(
                            fontSize: 12.dp,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff000000)),
                        controller: email,
                        decoration: InputDecoration(
                            constraints: BoxConstraints(
                                maxHeight: 18.w,
                                minHeight: 18.w,
                                maxWidth: 100.w,
                                minWidth: 100.w),
                            fillColor: const Color(0xffffffff),
                            focusColor: const Color(0xffffffff),
                            filled: true,
                            hintText: 'Enter your email id',
                            hintStyle: GoogleFonts.ubuntu(
                                fontSize: 12.dp,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffe8e9eb)),
                                borderRadius: BorderRadius.circular(100.w)),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffe8e9eb)),
                                borderRadius: BorderRadius.circular(100.w))),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.w),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: const Color(0xff000000),
                        style: GoogleFonts.ubuntu(
                            fontSize: 12.dp,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff000000)),
                        obscureText: true,
                        controller: password,
                        decoration: InputDecoration(
                            constraints: BoxConstraints(
                                maxHeight: 18.w,
                                minHeight: 18.w,
                                maxWidth: 100.w,
                                minWidth: 100.w),
                            fillColor: const Color(0xffffffff),
                            focusColor: const Color(0xffffffff),
                            filled: true,
                            hintText: 'Enter your password',
                            hintStyle: GoogleFonts.ubuntu(
                                fontSize: 12.dp,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffe8e9eb)),
                                borderRadius: BorderRadius.circular(100.w)),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffe8e9eb)),
                                borderRadius: BorderRadius.circular(100.w))),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 3.w, bottom: 1.w),
                      child: MaterialButton(
                        padding: EdgeInsets.all(2.w),
                        minWidth: 30.w,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.w)),
                        onPressed: () {
                          loginWithEP();
                        },
                        child: Text(
                          'Sign-In',
                          style: GoogleFonts.nunito(
                              fontSize: 16.dp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xffffffff)),
                        ),
                        color: const Color(0xff7D1EDB),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?',
                            style: GoogleFonts.ubuntu(
                                fontSize: 11.dp,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xffffffff))),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          },
                          child: Text('Sign-Up',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 11.dp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff7D1EDB))),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
