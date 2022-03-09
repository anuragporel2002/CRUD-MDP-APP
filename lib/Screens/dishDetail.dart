import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class DishDetail extends StatefulWidget {
  const DishDetail({Key? key}) : super(key: key);

  @override
  State<DishDetail> createState() => _DishDetailState();
}

class _DishDetailState extends State<DishDetail> {
  String imgUrl = "https://cdn-icons-png.flaticon.com/512/1375/1375210.png",
      name = "Chocolate Donut",
      price = "200";
  double _currentSliderValueP = 50;
  double _currentSliderValueC = 20;
  double _currentSliderValueF = 10;
  double _currentSliderValueK = 200;

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
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 3.w,
          ),
          GestureDetector(
            onTap: () async {
              /*final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      FirebaseStorage.instance
                          .ref()
                          .child(
                              'UsersDP/${FirebaseAuth.instance.currentUser!.uid}')
                          .putFile(File(image!.path))
                          .then((p0) {
                        p0.ref.getDownloadURL().then((value) {
                          print(value);
                          setState(() {
                            imgUrl = value;
                          });
                        });
                      });*/
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
                  backgroundColor: const Color(0xff000000),
                  child: imgUrl == ""
                      ? Padding(
                          padding: EdgeInsets.all(5.w),
                          child: Image.asset(
                            'img/cam.png',
                            fit: BoxFit.contain,
                          ))
                      : Container(
                          margin: EdgeInsets.all(1.w),
                          width: 30.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(imgUrl),
                                  fit: BoxFit.contain)),
                        ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6.w,
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.w),
              child: Text(
                name,
                style: GoogleFonts.ubuntu(
                    fontSize: 16.dp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              )),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.w),
              child: Text(
                '₹ $price',
                style: GoogleFonts.ubuntu(
                    fontSize: 15.dp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              )),
          Padding(
              padding: EdgeInsets.only(
                  left: 8.w, right: 8.w, top: 10.w, bottom: 1.w),
              child: Text(
                'Nutrients',
                style: GoogleFonts.ubuntu(
                    fontSize: 13.dp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(2.w, 1.w, 2.w, 0.w),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  thumbColor: Colors.transparent,
                  trackHeight: 2.w,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
              child: Slider(
                max: 300,
                activeColor: const Color(0xff7D1EDB),
                inactiveColor: Colors.grey.shade300,
                value: _currentSliderValueK,
                onChanged: (double value) {
                  setState(() {});
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
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
              child: Slider(
                max: 100,
                activeColor: const Color(0xff7D1EDB),
                inactiveColor: Colors.grey.shade300,
                value: _currentSliderValueP,
                onChanged: (double value) {
                  setState(() {});
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
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
              child: Slider(
                max: 100,
                activeColor: const Color(0xff7D1EDB),
                inactiveColor: Colors.grey.shade300,
                value: _currentSliderValueC,
                onChanged: (double value) {
                  setState(() {});
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
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
              child: Slider(
                max: 100,
                activeColor: const Color(0xff7D1EDB),
                inactiveColor: Colors.grey.shade300,
                value: _currentSliderValueF,
                onChanged: (double value) {
                  setState(() {});
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
        ],
      ),
    );
  }
}
