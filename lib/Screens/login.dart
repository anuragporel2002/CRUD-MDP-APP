import 'package:crudappmdp/Screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        /*decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('img/bg.jpg'), fit: BoxFit.fitHeight)),*/
        color: Colors.black,
        child: GlassmorphicContainer(
          alignment: Alignment.center,
          width: 100.w,
          height: 100.h,
          borderRadius: 0,
          linearGradient: LinearGradient(colors: [
            const Color(0xFF000000).withOpacity(0.05),
            const Color((0xFF000000)).withOpacity(0.05),
          ], stops: const [
            0.1,
            1
          ]),
          border: 0,
          blur: 5,
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF000000).withOpacity(0.5),
              const Color((0xFF000000)).withOpacity(0.5),
            ],
          ),
          child: GlassmorphicContainer(
            width: 80.w,
            height: 80.h,
            borderRadius: 5.w,
            linearGradient: LinearGradient(colors: [
              const Color(0xFFffffff).withOpacity(0.15),
              const Color(0xFFffffff).withOpacity(0.15),
            ], stops: const [
              0.1,
              1
            ]),
            border: 1,
            blur: 15,
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.15),
                const Color(0xFFffffff).withOpacity(0.15),
              ],
            ),
            child: Container(
              width: 80.w,
              height: 80.h,
              alignment: Alignment.center,
              margin: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(4.w),
                    width: 32.w,
                    height: 32.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('img/logos.png'),
                            fit: BoxFit.fitHeight)),
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.w),
                    child: GradientText('Sign In',
                        colors: const [
                          Color(0xff250544),
                          Color(0xff3A0BBD),
                          Color(0xffAB425C),
                          Color(0xff820F8E),
                          Color(0xff070361)
                        ],
                        gradientDirection: GradientDirection.ltr,
                        style: GoogleFonts.montserrat(
                          fontSize: 24.dp,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.w,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white38),
                            ),
                            focusColor: Colors.white,
                            label: Text(
                              'Email',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            hintText: 'example@xyz.com',
                            hintStyle: GoogleFonts.ubuntu(
                                fontSize: 11.dp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          style: GoogleFonts.ubuntu(
                              fontSize: 11.dp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 12.w,
                        ),
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: Colors.white,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white38),
                            ),
                            label: Text(
                              'Password',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            hintText: 'xxxxxx',
                            hintStyle: GoogleFonts.ubuntu(
                                fontSize: 11.dp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          style: GoogleFonts.ubuntu(
                              fontSize: 11.dp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 15.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: GlassmorphicContainer(
                            alignment: Alignment.center,
                            width: 40.w,
                            height: 6.5.h,
                            borderRadius: 5.w,
                            linearGradient: LinearGradient(colors: [
                              const Color(0xff250544).withOpacity(1),
                              const Color(0xff070361).withOpacity(1),
                            ], stops: const [
                              0.1,
                              1
                            ]),
                            border: 1,
                            blur: 0,
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.7),
                                const Color(0xFFffffff).withOpacity(0.7),
                              ],
                            ),
                            child: GradientText('Sign In',
                                colors: const [
                                  Color.fromARGB(255, 233, 210, 255),
                                  Color.fromARGB(255, 204, 185, 255),
                                  Color.fromARGB(255, 255, 207, 219),
                                  Color.fromARGB(255, 248, 184, 255),
                                  Color.fromARGB(255, 199, 196, 255)
                                ],
                                gradientDirection: GradientDirection.ltr,
                                style: GoogleFonts.ubuntu(
                                  fontSize: 20.dp,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 7.w,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account? ',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 10.dp, color: Colors.white)),
                              SizedBox(
                                width: 1.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUp()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xff250544)
                                          .withOpacity(0.8),
                                      borderRadius:
                                          BorderRadius.circular(1.5.w)),
                                  padding: EdgeInsets.all(1.w),
                                  child: GradientText('Sign Up',
                                      colors: const [
                                        Color.fromARGB(255, 245, 234, 255),
                                        Color.fromARGB(255, 225, 214, 255),
                                        Color.fromARGB(255, 255, 217, 227),
                                        Color.fromARGB(255, 251, 217, 255),
                                        Color.fromARGB(255, 228, 227, 255)
                                      ],
                                      gradientDirection: GradientDirection.ltr,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 10.dp,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
