import 'package:crudappmdp/Screens/addDish.dart';
import 'package:crudappmdp/Screens/dishDetail.dart';
import 'package:crudappmdp/Screens/editDish.dart';
import 'package:crudappmdp/Screens/login.dart';
import 'package:crudappmdp/Screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: const DishDetail(),
      );
    });
  }
}
