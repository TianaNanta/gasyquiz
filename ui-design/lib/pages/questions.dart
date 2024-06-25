import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFEACF),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 31, 8, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 18.5),
                  child: SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 7.5, 15, 15.5),
                          child: SizedBox(
                            width: 229,
                            child: Text(
                              'Question 1',
                              style: GoogleFonts.getFont(
                                'Fredoka',
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                height: 1.5,
                                color: Color(0xFF753A11),
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                              Positioned(
                                top: -11,
                                child: SizedBox(
                                  width: 56,
                                  height: 53,
                                  child: SvgPicture.asset(
                                    'assets/vectors/ellipse_1_x2.svg',
                                  ),
                                ),
                              ),
                        Container(
                              padding: EdgeInsets.fromLTRB(17.6, 11, 18.6, 12),
                              child: Text(
                                '02',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  height: 1.5,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(4, 0, 4, 458.5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Questions',
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        height: 1.5,
                        color: Color(0xFF753A11),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF753A11)),
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Container(
                        width: 184,
                        padding: EdgeInsets.fromLTRB(0, 4.5, 12.2, 4.5),
                        child: Text(
                          'Next',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            height: 1.5,
                            color: Color(0xFF753A11),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: -47.6,
              top: 179.5,
              child: Transform(
                transform: Matrix4.identity()..rotationZ(-0.1745330593),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/madagascar_flag_isolated_on_white_removebg_preview_1.png',
                      ),
                    ),
                  ),
                  child: Container(
                    width: 480.9,
                    height: 443.5,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 252,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFF9F734B),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40000000),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Container(
                  width: 300,
                  height: 60,
                  padding: EdgeInsets.fromLTRB(0, 11, 5.6, 11),
                  child: Text(
                    'A',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      height: 1.5,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 351,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFF9F734B),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40000000),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Container(
                  width: 300,
                  height: 60,
                  padding: EdgeInsets.fromLTRB(0, 11, 5.6, 11),
                  child: Text(
                    'A',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      height: 1.5,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 334,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFF9F734B),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40000000),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Container(
                  width: 300,
                  height: 60,
                  padding: EdgeInsets.fromLTRB(0, 11, 5.6, 11),
                  child: Text(
                    'A',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      height: 1.5,
                      color: Color(0xFFFFFFFF),
                    ),
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