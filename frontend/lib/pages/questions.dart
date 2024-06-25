import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Questions extends StatelessWidget {
  Questions({super.key});

  Future<String> _getQuestion(id) async {
    var resp = await http.get(
      Uri.parse('${globals.api_url}/question/$id'),
      headers: {'API_KEY': globals.api_key}
      );
    if (resp.statusCode == 201 || resp.statusCode == 200) {
      return resp.body;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    var cmap = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    var categoryId = cmap['categoryId'];

    return FutureBuilder(
        future: _getQuestion(categoryId),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            final data = snapshot.data as Map<String, List<String>>;
            return Scaffold(
              backgroundColor: const Color(0xFFFFEACF),
              body: Stack(
                children: [
                  Positioned(
                    right: -50,
                    top: 130,
                    child: Opacity(
                      opacity: 0.3,
                      child: Transform.rotate(
                        angle: -10 * 3.14159 / 180,
                        child: Image.asset(
                          'assets/images/madagascar_flag_isolated_on_white_removebg_preview_1.png',
                          width: 500,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 31, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildHeader(),
                            const SizedBox(height: 10),
                            Text(
                              'Questions',
                              style: GoogleFonts.robotoCondensed(
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                                color: Color(0xFF753A11),
                              ),
                            ),
                            SizedBox(height: 70),
                            _buildAnswerButton('A'),
                            SizedBox(height: 25),
                            _buildAnswerButton('B'),
                            SizedBox(height: 25),
                            _buildAnswerButton('C'),
                            SizedBox(height: 25),
                            Center(child: _buildNextButton()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Fanontaniana 1',
            style: GoogleFonts.fredoka(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: const Color(0xFF753A11),
            ),
          ),
        ),
        // Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     SvgPicture.asset(
        //       'assets/vectors/ellipse_1_x2.svg',
        //       width: 56,
        //       height: 53,
        //     ),
        //     Text(
        //       '02',
        //       style: GoogleFonts.robotoCondensed(
        //         fontWeight: FontWeight.w400,
        //         fontSize: 20,
        //         color: const Color(0xFFFFFFFF),
        //       ),
        //     ),
        //   ],
        // ),
        const CircularCountDownTimer(
            width: 56,
            height: 53,
            duration: 60,
            initialDuration: 0,
            ringColor: Color(0xFF753A11),
            fillColor: Colors.green
        ),
      ],
    );
  }

  Widget _buildAnswerButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9F734B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        elevation: 4,
      ),
      onPressed: () {},
      child: Text(
        text,
        style: GoogleFonts.robotoCondensed(
          fontWeight: FontWeight.w400,
          fontSize: 25,
          color: const Color(0xFFFFFFFF),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFF753A11)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        elevation: 4,
      ),
      onPressed: () {},
      child: Text(
        'Manaraka',
        style: GoogleFonts.robotoCondensed(
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: const Color(0xFF753A11),
        ),
      ),
    );
  }
}