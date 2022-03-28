import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudappmdp/Screens/addDish.dart';
import 'package:crudappmdp/Screens/decision.dart';
import 'package:crudappmdp/Widgets/productTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        backgroundColor: const Color(0xff000000),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('FOOD',
                    style: GoogleFonts.ubuntu(
                        fontSize: 42.dp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffffffff).withOpacity(0.2))),
                Text('LOVER',
                    style: GoogleFonts.ubuntu(
                        fontSize: 42.dp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff7D1EDB).withOpacity(0.2))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('FOOD',
                    style: GoogleFonts.ubuntu(
                        fontSize: 24.dp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffffffff))),
                Text('LOVER',
                    style: GoogleFonts.ubuntu(
                        fontSize: 24.dp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff7D1EDB))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const DecisionPage()));
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Color(0xffffffff),
                    ))
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => const AddDish())));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff7D1EDB),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Products').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff7D1EDB),
                ),
              );
            } else {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              return ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(bottom: 18.w),
                children: documents.map((doc) {
                  return ProductTile(
                    cal: doc['calories'],
                    fat: doc['fat'],
                    carb: doc['carb'],
                    img: doc['imgUrl'],
                    name: doc['productName'],
                    price: doc['price'],
                    prodID: doc['prodID'],
                    prot: doc['protein'],
                  );
                }).toList(),
              );
            }
          }),
    );
  }
}
