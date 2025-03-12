import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        // backgroundColor: Colors.black38,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8),
        //   side:
        //   BorderSide(color: Colors.white, width: 1),
        // ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xFFFFFFFF),
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: GoogleFonts.nunito(
              color: const Color(0xFFFFFFFF),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
