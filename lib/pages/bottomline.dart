import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bottomline extends StatelessWidget {
  const Bottomline({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double fontSize = screenWidth < 600 ? 16 : 20;
        double padding = screenWidth < 600 ? 20 : 40;

        return Container(
          color: Color(0xFF171717),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "🔥💙.Designed and developed with Flutter and passion.💙🔥",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Color(0xFFFFFFFF),
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
