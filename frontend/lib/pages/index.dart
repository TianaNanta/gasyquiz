import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF9F734B),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSideImage(),
                    Expanded(child: _buildTitle(context)),
                    _buildSideImage(),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              _buildButton('Hilalao', Color(0xFF753A11), Color(0xFFFFFFFF)),
              const SizedBox(height: 40),
              // _buildButton('Add Quiz', Color(0xFFFFEACF), Color(0xFF753A11)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSideImage() {
    return SizedBox(
      width: 70,
      child: AspectRatio(
        aspectRatio: 70 / 489,
        child: Image.asset(
          'assets/images/img_3.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: (MediaQuery.sizeOf(context).height / 4) - 50.0),
        Text(
          'Quiz Gasy',
          style: GoogleFonts.fredoka(
            fontWeight: FontWeight.w400,
            fontSize: 50,
            color: const Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 7,
          margin: EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.w400,
            fontSize: 32,
            color: textColor,
          ),
        ),
      ),
    );
  }
}