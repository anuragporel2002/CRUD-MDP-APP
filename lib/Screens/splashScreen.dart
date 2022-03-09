import 'dart:async';
import 'package:crudappmdp/Screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xff000000),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: 50.w,
                height: 50.w,
                child: Image.asset(
                  'img/logoc.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 50.w,
              child: const LinearProgressIndicator(
                color: Color(0xff7D1EDB),
                backgroundColor: Color(0xffffffff),
              ),
            )
          ],
        ),
      ),
    );
  }
}
