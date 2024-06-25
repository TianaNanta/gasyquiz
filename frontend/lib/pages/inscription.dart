import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Inscription extends StatelessWidget {
  final pseudo_controller = TextEditingController();
  final email_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEACF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 45.5),
                Text(
                  'Inscription',
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                    color: const Color(0xFF753A11),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 79.5),
                _buildTextField('Pseudo', pseudo_controller),
                const SizedBox(height: 38),
                _buildTextField('Email', email_controller),
                const SizedBox(height: 46),
                _buildButton('OK', pseudo_controller, email_controller, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController ctrl) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFC9F734B)),
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFFFFFFF),
      ),
      child: TextField(
        controller: ctrl,
        style: GoogleFonts.robotoCondensed(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: const Color(0xFF828282),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: const Color(0x80828282),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildButton(String text, TextEditingController p, TextEditingController m, BuildContext ctx) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFC9F734B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        elevation: 4,
        shadowColor: const Color(0x40000000),
      ),
      onPressed: () async {
        var pseudo = p.text;
        var email = m.text;

        var resp = await http.post(
          Uri.parse(globals.api_url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String> {
            'username': pseudo,
            'password': email,
          }),
        );

        if (resp.statusCode == 201 || resp.statusCode == 200) {
          Navigator.of(ctx).pushNamed('/index');
        }
      },
      child: Text(
        text,
        style: GoogleFonts.robotoCondensed(
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: const Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}