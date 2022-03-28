import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudappmdp/Screens/decision.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditDish extends StatefulWidget {
  final String prodID, name, price, img;
  final int prot, cal, fat, carb;
  const EditDish(
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
  State<EditDish> createState() => _EditDishState();
}

class _EditDishState extends State<EditDish> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  String imgUrl = "";
  bool imgReady = false, uploading = false;
  double _currentSliderValueP = 0;
  double _currentSliderValueC = 0;
  double _currentSliderValueF = 0;
  double _currentSliderValueK = 0;
  final ImagePicker _picker = ImagePicker();
  late File img;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      name.text = widget.name;
      price.text = widget.price;
      imgUrl = widget.img;
      _currentSliderValueC = widget.carb.toDouble();
      _currentSliderValueP = widget.prot.toDouble();
      _currentSliderValueK = widget.cal.toDouble();
      _currentSliderValueF = widget.fat.toDouble();
    });
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xffffffff),
                    ))
              ],
            ),
          ],
        ),
      ),
      body: uploading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xff7D1EDB),
              ),
            )
          : ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: 3.w,
                ),
                GestureDetector(
                  onTap: () async {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      img = File(image!.path);
                      imgReady = true;
                    });
                  },
                  child: CircleAvatar(
                    radius: 16.w,
                    child: DottedBorder(
                      radius: Radius.circular(16.w),
                      color: imgUrl == ""
                          ? const Color(0xff454545)
                          : const Color(0xff000000),
                      strokeWidth: 2,
                      dashPattern: const [8, 4],
                      borderType: BorderType.Circle,
                      child: CircleAvatar(
                        radius: 16.w,
                        backgroundColor: const Color(0xffffffff),
                        child: imgUrl == ""
                            ? Padding(
                                padding: EdgeInsets.all(5.w),
                                child: Image.asset(
                                  'img/cam.png',
                                  fit: BoxFit.contain,
                                ))
                            : !imgReady
                                ? Container(
                                    margin: EdgeInsets.all(1.w),
                                    width: 30.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                        image: DecorationImage(
                                            image: NetworkImage(imgUrl),
                                            fit: BoxFit.contain)),
                                  )
                                : Container(
                                    margin: EdgeInsets.all(1.w),
                                    width: 30.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                        image: DecorationImage(
                                            image: MemoryImage(
                                                img.readAsBytesSync()),
                                            fit: BoxFit.contain)),
                                  ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.w),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.grey,
                    style: GoogleFonts.ubuntu(
                        fontSize: 12.dp,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                    controller: name,
                    decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: 18.w,
                            minHeight: 18.w,
                            maxWidth: 100.w,
                            minWidth: 100.w),
                        fillColor: const Color(0xff424242),
                        focusColor: const Color(0xff424242),
                        filled: true,
                        hintText: 'Enter dish name',
                        hintStyle: GoogleFonts.ubuntu(
                            fontSize: 12.dp,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff424242)),
                            borderRadius: BorderRadius.circular(100.w)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff424242)),
                            borderRadius: BorderRadius.circular(100.w)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff424242)),
                            borderRadius: BorderRadius.circular(100.w))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.w),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.grey,
                    style: GoogleFonts.ubuntu(
                        fontSize: 12.dp,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                    controller: price,
                    decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: 18.w,
                            minHeight: 18.w,
                            maxWidth: 100.w,
                            minWidth: 100.w),
                        fillColor: const Color(0xff424242),
                        focusColor: const Color(0xff424242),
                        filled: true,
                        hintText: 'Enter dish price',
                        hintStyle: GoogleFonts.ubuntu(
                            fontSize: 12.dp,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff424242)),
                            borderRadius: BorderRadius.circular(100.w)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff424242)),
                            borderRadius: BorderRadius.circular(100.w)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff424242)),
                            borderRadius: BorderRadius.circular(100.w))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.w, 2.w, 2.w, 0.w),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.transparent,
                        trackHeight: 2.w,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0)),
                    child: Slider(
                      max: 300,
                      activeColor: const Color(0xff7D1EDB),
                      inactiveColor: Colors.grey.shade300,
                      value: _currentSliderValueK,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValueK = value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 1.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Calories',
                        style: GoogleFonts.ubuntu(
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        '${_currentSliderValueK.round()} kcal',
                        style: GoogleFonts.ubuntu(
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.w, 0.w, 2.w, 0.w),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.transparent,
                        trackHeight: 2.w,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0)),
                    child: Slider(
                      max: 100,
                      activeColor: const Color(0xff7D1EDB),
                      inactiveColor: Colors.grey.shade300,
                      value: _currentSliderValueP,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValueP = value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 2.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Protein',
                        style: GoogleFonts.ubuntu(
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        '${_currentSliderValueP.round()} g',
                        style: GoogleFonts.ubuntu(
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.w, 0.w, 2.w, 0.w),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.transparent,
                        trackHeight: 2.w,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0)),
                    child: Slider(
                      max: 100,
                      activeColor: const Color(0xff7D1EDB),
                      inactiveColor: Colors.grey.shade300,
                      value: _currentSliderValueC,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValueC = value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 2.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Carbohydrates',
                        style: GoogleFonts.ubuntu(
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text('${_currentSliderValueC.round()} g',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13.dp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.w, 0.w, 2.w, 0.w),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.transparent,
                        trackHeight: 2.w,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0)),
                    child: Slider(
                      max: 100,
                      activeColor: const Color(0xff7D1EDB),
                      inactiveColor: Colors.grey.shade300,
                      value: _currentSliderValueF,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValueF = value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 2.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fat',
                        style: GoogleFonts.ubuntu(
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        '${_currentSliderValueF.round()} g',
                        style: GoogleFonts.ubuntu(
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 3.w, bottom: 1.w),
                  child: MaterialButton(
                    padding: EdgeInsets.all(2.w),
                    minWidth: 40.w,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.w)),
                    onPressed: () {
                      setState(() {
                        uploading = true;
                      });
                      imgReady
                          ? FirebaseStorage.instance
                              .ref()
                              .child('Products/${widget.prodID}')
                              .putFile(img)
                              .then((p0) {
                              p0.ref.getDownloadURL().then((value) {
                                FirebaseFirestore.instance
                                    .collection('Products')
                                    .doc(widget.prodID)
                                    .set({
                                  'productName': name.text,
                                  'price': price.text,
                                  'calories': _currentSliderValueK.round(),
                                  'protein': _currentSliderValueP.round(),
                                  'carb': _currentSliderValueC.round(),
                                  'fat': _currentSliderValueF.round(),
                                  'imgUrl': value
                                }, SetOptions(merge: true));
                                setState(() {
                                  uploading = false;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DecisionPage()));
                              });
                            })
                          : FirebaseFirestore.instance
                              .collection('Products')
                              .doc(widget.prodID)
                              .set({
                              'productName': name.text,
                              'price': price.text,
                              'calories': _currentSliderValueK.round(),
                              'protein': _currentSliderValueP.round(),
                              'carb': _currentSliderValueC.round(),
                              'fat': _currentSliderValueF.round(),
                            }, SetOptions(merge: true)).then((value) {
                              setState(() {
                                uploading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DecisionPage()));
                            });
                    },
                    child: Text(
                      'Update Dish',
                      style: GoogleFonts.ubuntu(
                          fontSize: 13.dp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffffffff)),
                    ),
                    color: const Color(0xff7D1EDB),
                  ),
                ),
              ],
            ),
    );
  }
}
