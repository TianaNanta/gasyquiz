import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFEACF),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 22,
                  top: 51,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/silhouette_de_baobabs_et_tente_de_voyage_sur_fond_de_ciel_coucher_de_soleil_camp_dt_paysage_de_removebg_preview_1.png',
                        ),
                      ),
                    ),
                    child: Container(
                      width: 336,
                      height: 228,
                    ),
                  ),
                ),
          SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 58, 0, 127),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(1, 0, 0, 28),
                          child: Text(
                            'Quiz Gasy',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: 38,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment(1, -0.763),
                              end: Alignment(-2.817, 2.161),
                              colors: <Color>[Color(0xC79F734B)],
                              stops: <double>[0],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x40000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(21, 17, 21, 18),
                            child: Text(
                              'Discovery 
                            Quizz',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -4,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SizedBox(
                width: 390,
                height: 569,
                child: Container(
                  padding: EdgeInsets.fromLTRB(28, 24, 28, 0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 78,
                        top: 40,
                        child: Opacity(
                          opacity: 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/img_1.png',
                                ),
                              ),
                            ),
                            child: Container(
                              width: 127,
                              height: 435,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 23),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Choose category',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30,
                                  color: Color(0xFF753A11),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFEACF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                width: 139,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 16, 0, 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                'assets/images/lhistoire_1.png',
                                              ),
                                            ),
                                          ),
                                          child: Container(
                                            width: 55,
                                            height: 59,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                                        child: Text(
                                          'Tantara',
                                          style: GoogleFonts.getFont(
                                            'Roboto Condensed',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17,
                                            color: Color(0xFF753A11),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFEACF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            width: 139,
                            height: 121,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 11, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/carte_1.png',
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      width: 67,
                                      height: 67,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                                    child: Text(
                                      'Jeografia',
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                        color: Color(0xFF753A11),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 81,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFEACF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            width: 139,
                            height: 121,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 14, 0, 11),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 1, 9),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/images/maki_1.png',
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        width: 49,
                                        height: 47,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Biby sy Zava-maniry',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Color(0xFF753A11),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 4,
                        top: 58,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFEACF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            width: 139,
                            height: 121,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/images/valiha_11.png',
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        width: 52,
                                        height: 52,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Kolontsaina',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Color(0xFF753A11),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFEACF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            width: 139,
                            height: 121,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/langues_1.png',
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      width: 51,
                                      height: 51,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                                  child: Text(
                                    'Fiteny',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Color(0xFF753A11),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 4,
                        bottom: 81,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFEACF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            width: 139,
                            height: 121,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 14, 0, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 5, 3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/images/celebre_1.png',
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        width: 50,
                                        height: 54,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Artista sy 
                                  Olo-malaza',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Color(0xFF753A11),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}