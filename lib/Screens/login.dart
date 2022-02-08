import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('img/bg.jpg'), fit: BoxFit.fitHeight)),
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
              const Color(0xFFffffff).withOpacity(0.1),
              const Color(0xFFffffff).withOpacity(0.1),
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
                const Color(0xFFffffff).withOpacity(0.1),
                const Color(0xFFffffff).withOpacity(0.1),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
