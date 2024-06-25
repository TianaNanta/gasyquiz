import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import '../utils.dart';
import '../globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEACF),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 22,
                      top: 51,
                      child: Image.asset(
                        'assets/images/silhouette_de_baobabs_et_tente_de_voyage_sur_fond_de_ciel_coucher_de_soleil_camp_dt_paysage_de_removebg_preview_1.png',
                        width: 336,
                        height: 228,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 58,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            'Quiz Gasy',
                            style: GoogleFonts.robotoCondensed(
                              fontWeight: FontWeight.w400,
                              fontSize: 38,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment(1, -0.763),
                                end: Alignment(-2.817, 2.161),
                                colors: <Color>[Color(0xC79F734B)],
                                stops: <double>[0],
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.fromLTRB(21, 17, 21, 18),
                            child: Text(
                              'Discovery Quizz',
                              style: GoogleFonts.robotoCondensed(
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0)
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(28, 24, 28, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Safidio ny sokajy',
                          style: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.w400,
                            fontSize: 30,
                            color: Color(0xFF753A11),
                          ),
                        ),
                      ),
                      const SizedBox(height: 23),
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildCategoryItem('Tantara', 'assets/images/lhistoire_1.png', context),
                          _buildCategoryItem('Jeografia', 'assets/images/carte_1.png', context),
                          _buildCategoryItem('Biby sy Zava-maniry', 'assets/images/maki_1.png', context),
                          _buildCategoryItem('Kolontsaina', 'assets/images/valiha_11.png', context),
                          _buildCategoryItem('Fiteny', 'assets/images/langues_1.png', context),
                          _buildCategoryItem('Artista sy Olo-malaza', 'assets/images/celebre_1.png', context),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imagePath, BuildContext ctx) {
    return GestureDetector(
      onTap: () {
        var categoryId = 0;
        if (title == "Tantara") categoryId = 1;
        else if (title == "Jeografia") categoryId = 2;
        else if (title == "Biby sy Zava-maniry") categoryId = 3;
        else if (title == "Kolontsaina") categoryId = 4;
        else if (title == "Fiteny") categoryId = 5;
        else if (title == "Artista sy Olo-malaza") categoryId = 6;

        Navigator.of(ctx).pushNamed('/questions', arguments: categoryId);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFEACF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 55,
              height: 59,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: const Color(0xFF753A11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}