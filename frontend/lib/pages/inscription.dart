import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Inscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEACF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 45.5),
                Text(
                  'Inscription',
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                    color: Color(0xFF753A11),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 79.5),
                _buildTextField('Pseudo'),
                SizedBox(height: 38),
                _buildTextField('Email'),
                SizedBox(height: 46),
                _buildButton('Ok'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFC9F734B)),
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFFFFFF),
      ),
      child: TextField(
        style: GoogleFonts.robotoCondensed(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Color(0xFF828282),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color(0x80828282),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFC9F734B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
        elevation: 4,
        shadowColor: Color(0x40000000),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: GoogleFonts.robotoCondensed(
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}