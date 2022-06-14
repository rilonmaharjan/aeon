import 'dart:async';

import 'package:attendance/view/check_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../curve_shape.dart';

class ScanCode extends StatefulWidget {
  const ScanCode({Key? key}) : super(key: key);

  @override
  State<ScanCode> createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
  bool blinkTikTik = true;
  String? _hourString, _minuteString, _dayString, _dateString;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (Timer time) => blink);
    _hourString = _formatHour(DateTime.now());
    _minuteString = _formatMinute(DateTime.now());
    _dateString = _formatDate(DateTime.now());
    _dayString = _formatDay(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getDateTime());
    super.initState();
  }

  String _formatHour(DateTime hour) {
    return DateFormat('hh').format(hour);
  }

  String _formatMinute(DateTime min) {
    return DateFormat('mm').format(min);
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy/M/d').format(date);
  }

  String _formatDay(DateTime day) {
    return DateFormat('EEEE').format(day);
  }

  _getDateTime() {
    final DateTime now = DateTime.now();
    final String formattedHour = _formatHour(now);
    final String formattedMinute = _formatMinute(now);
    final String formattedDate = _formatDate(now);
    final String formattedDay = _formatDay(now);
    setState(() {
      _hourString = formattedHour;
      _minuteString = formattedMinute;
      _dateString = formattedDate;
      _dayString = formattedDay;
    });
  }

  blink() {
    setState(() {
      blinkTikTik = !blinkTikTik;
    });
    if (blinkTikTik == false) {
      return " : ";
    } else {
      return "   ";
    }
  }

  decorationBox() {
    return const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 1, color: Color(0xffEE3253)),
          left: BorderSide(width: 1, color: Color(0xffEE3253)),
          right: BorderSide(width: 1, color: Color(0xffEE3253)),
          bottom: BorderSide(width: 1, color: Color(0xffEE3253)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              ClipPath(
                child: Container(
                    width: size.width,
                    height: size.height / 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 174, 22, 121),
                          Color.fromARGB(255, 255, 70, 191),
                        ],
                      ),
                    )),
                clipper: MyCustomClipper(),
              ),
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.069,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 4.0,
                          titlePadding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 33, top: 48),
                          title: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 2),
                                width: 325,
                                height: 61,
                                decoration: decorationBox(),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  cursorColor: const Color(0xffEE3253),
                                  style: GoogleFonts.notoSans(
                                    color: const Color(0xff000000),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                      hintText: '店舗コード',
                                      hintStyle: GoogleFonts.notoSans(
                                        color: const Color(0xff000000),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                              const SizedBox(
                                height: 21,
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 2),
                                width: 325,
                                height: 61,
                                decoration: decorationBox(),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  cursorColor: const Color(0xffEE3253),
                                  style: GoogleFonts.notoSans(
                                    color: const Color(0xff000000),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                      hintText: 'パスコード',
                                      hintStyle: GoogleFonts.notoSans(
                                        color: const Color(0xff000000),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                              const SizedBox(
                                height: 51,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("確認"),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    fixedSize: const Size(250, 46),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    textStyle: GoogleFonts.notoSans(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0.32,
                                    ),
                                    primary: const Color.fromARGB(
                                        255, 126, 211, 33)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text("イオンモール　橋本店",
                        style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    height: size.height * 0.155,
                  ),
                  Text(
                    _dateString.toString() + " ($_dayString)",
                    style: GoogleFonts.notoSans(
                        color: const Color.fromARGB(255, 254, 254, 254),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.32),
                  ),
                  SizedBox(
                    height: size.height * 0.011,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _hourString.toString(),
                        style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.241778),
                      ),
                      Text(
                        "${blink()}",
                        style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 62,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.241778),
                      ),
                      Text(
                        _minuteString.toString(),
                        style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.241778),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.041,
          ),
          GestureDetector(
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4.0,
                  titlePadding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 47, top: 48),
                  title: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 2),
                        width: 325,
                        height: 61,
                        decoration: decorationBox(),
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: const Color(0xffEE3253),
                          style: GoogleFonts.notoSans(
                            color: const Color(0xff000000),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                              hintText: '会員番号を入力',
                              hintStyle: GoogleFonts.notoSans(
                                color: const Color(0xff000000),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("確認"),
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            fixedSize: const Size(250, 46),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            textStyle: GoogleFonts.notoSans(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.32,
                            ),
                            primary: const Color.fromARGB(255, 126, 211, 33)),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text(
              "会員番号をスキャンしてください",
              style: GoogleFonts.notoSans(
                  color: const Color.fromARGB(255, 30, 36, 50),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.32),
            ),
          ),
          SizedBox(
            height: size.height * 0.038,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CheckIn()));
            },
            child: Image.asset(
              "assets/images/QRcode.png",
              height: 138,
              width: 138,
            ),
          ),
          SizedBox(
            height: size.height * 0.064,
          ),
        ],
      )),
    );
  }
}
