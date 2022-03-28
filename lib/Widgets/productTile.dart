import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudappmdp/Screens/dishDetail.dart';
import 'package:crudappmdp/Screens/editDish.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatelessWidget {
  final String prodID, name, price, img;
  final int prot, cal, fat, carb;
  const ProductTile(
      {Key? key,
      required this.prodID,
      required this.name,
      required this.price,
      required this.prot,
      required this.cal,
      required this.fat,
      required this.carb,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.w, horizontal: 6.w),
      width: 100.w,
      height: 15.h,
      decoration: BoxDecoration(
          color: const Color(0xff424242),
          borderRadius: BorderRadius.circular(4.w)),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DishDetail(
                              prodID: prodID,
                              name: name,
                              price: price,
                              prot: prot,
                              cal: cal,
                              fat: fat,
                              carb: carb,
                              img: img)));
                },
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 16.5.w,
                    backgroundImage: NetworkImage(img),
                  ),
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(right: 4.w),
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            children: [
                              Text(
                                name,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 15.dp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            children: [
                              Text(
                                '₹ $price',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 15.dp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.transparent,
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff252525),
                                      borderRadius: BorderRadius.circular(2.w),
                                    ),
                                    margin: EdgeInsets.only(
                                        right: 1.w, bottom: 2.w),
                                    child: IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.white),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => EditDish(
                                                    prodID: prodID,
                                                    name: name,
                                                    price: price,
                                                    prot: prot,
                                                    cal: cal,
                                                    fat: fat,
                                                    carb: carb,
                                                    img: img)));
                                      },
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff7D1EDB),
                                        borderRadius:
                                            BorderRadius.circular(2.w),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.white),
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('Products')
                                              .doc(prodID)
                                              .delete()
                                              .then((value) {
                                            FirebaseStorage.instance
                                                .ref()
                                                .child('Products/$prodID')
                                                .delete();
                                          });
                                        },
                                      ),
                                      margin: EdgeInsets.only(
                                          left: 1.w, bottom: 2.w))),
                            ],
                          ),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
