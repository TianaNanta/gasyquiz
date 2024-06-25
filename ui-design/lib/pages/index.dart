import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFF9F734B),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 21, 0, 128),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 36),
              child: SizedBox(
                width: 480,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 37.4, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/img_3.png',
                            ),
                          ),
                        ),
                        child: Container(
                          width: 103,
                          height: 489,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 105, 40.4, 318),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Quiz Gasy',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: 50,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(9.6, 0, 10.6, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                width: 176,
                                height: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/img_3.png',
                          ),
                        ),
                      ),
                      child: Container(
                        width: 103,
                        height: 489,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 38),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF753A11),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: 218,
                  padding: EdgeInsets.fromLTRB(0, 9, 19.6, 9),
                  child: Text(
                    'Start',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      height: 1.5,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFEACF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 218,
                padding: EdgeInsets.fromLTRB(0, 9, 28.4, 9),
                child: Text(
                  'Add Quiz',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    height: 1.5,
                    color: Color(0xFF753A11),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}