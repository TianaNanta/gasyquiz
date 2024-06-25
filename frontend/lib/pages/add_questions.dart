import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils.dart';
import 'package:google_fonts/google_fonts.dart';

class AddQuestions extends StatelessWidget {
  const AddQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFFEACF),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 62.5, 0, 220),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(2, 0, 0, 30.5),
              child: Text(
                'Add Quiz',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w400,
                  fontSize: 36,
                  height: 1.5,
                  color: const Color(0xFF753A11),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 31),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF9F734B)),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFFFFFF),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 80),
                  child: Text(
                    'Question...',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      height: 1.5,
                      color: Color(0x80828282),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 23),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFC9F734B)),
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFFFFFF),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 9, 12, 12),
                child: Text(
                  'Response 1',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    height: 1.5,
                    color: const Color(0x80828282),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 23),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFC9F734B)),
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFFFFF),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(12, 9, 12, 12),
                child: Text(
                  'Response 2',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    height: 1.5,
                    color: Color(0x80828282),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFC9F734B)),
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFFFFF),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(12, 9, 12, 12),
                child: Text(
                  'Response 3',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    height: 1.5,
                    color: Color(0x80828282),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFC9F734B),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(0, 4),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Container(
                width: 184,
                padding: const EdgeInsets.fromLTRB(0, 5.5, 20.8, 5.5),
                child: Text(
                  'Validate',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    height: 1.5,
                    color: const Color(0xFFFFFFFF),
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