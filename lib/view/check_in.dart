import 'dart:async';

import 'package:attendance/change.dart';
import 'package:attendance/curve_shape.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  Change changeTo = Change();
  var count = 0;
  bool blinkTikTik = true;
  String? _hourString, _minuteString, _dayString, _dateString;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) => blink);
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              ClipPath(
                child: Container(
                  width: size.width,
                  height: size.height / 2,
                  decoration: BoxDecoration(
                    gradient: count == 0
                        ? const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 126, 211, 33),
                              Color.fromARGB(255, 255, 77, 44),
                            ],
                          )
                        : count == 1
                            ? changeTo.gradientColor1()
                            : count == 2
                                ? changeTo.gradientColor2()
                                : changeTo.gradientColor3(),
                  ),
                ),
                clipper: MyCustomClipper(),
              ),
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.069,
                  ),
                  Text("イオンモール　橋本店",
                      style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400)),
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
          Text(
            "4901750404857",
            style: GoogleFonts.notoSans(
                color: const Color.fromARGB(255, 30, 36, 50),
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.32),
          ),
          SizedBox(
            height: size.height * 0.019,
          ),
          Text(
            count == 0
                ? "橋本いとは"
                : count == 1
                    ? "橋本いとは"
                    : count == 2
                        ? "橋本いとは"
                        : "会員番号エラー",
            style: GoogleFonts.notoSans(
              color: count == 0
                  ? const Color.fromARGB(255, 30, 36, 50)
                  : count == 1
                      ? const Color.fromARGB(255, 30, 36, 50)
                      : count == 2
                          ? const Color.fromARGB(255, 30, 36, 50)
                          : const Color.fromARGB(255, 241, 68, 66),
              fontSize: 34,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.241778,
            ),
          ),
          SizedBox(
            height: size.height * 0.075,
          ),
          Text(
            count == 0
                ? "11:30 ~ 12:30"
                : count == 1
                    ? "11:30 ~ 12:30"
                    : count == 2
                        ? ""
                        : "",
            style: GoogleFonts.notoSans(
              color: const Color.fromARGB(255, 30, 36, 50),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.32,
            ),
          ),
          Text(
            count == 0
                ? "七田式キリンクラス"
                : count == 1
                    ? "七田式キリンクラス"
                    : count == 2
                        ? ""
                        : "",
            style: GoogleFonts.notoSans(
              color: const Color.fromARGB(255, 30, 36, 50),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.32,
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Text(
              count == 0
                  ? "チェックインしました"
                  : count == 1
                      ? changeTo.buttonText1()
                      : count == 2
                          ? changeTo.buttonText2()
                          : changeTo.buttonText3(),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              fixedSize: const Size(275, 46),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              textStyle: GoogleFonts.notoSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.32,
              ),
              primary: count == 0
                  ? const Color.fromARGB(255, 126, 211, 33)
                  : count == 1
                      ? changeTo.buttonColor1()
                      : count == 2
                          ? changeTo.buttonColor2()
                          : changeTo.buttonColor3(),
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

