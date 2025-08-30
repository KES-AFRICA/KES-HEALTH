import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';

class InfoText extends StatelessWidget {
  final String title;
  final String subtitle;
  final double screenWidth;
  final double screenHeight;

  const InfoText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Texte principal
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: AppColors.darkBlue,
              fontSize: screenWidth * 0.08,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        // Sous-texte
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Text(
            subtitle,
            style: GoogleFonts.poppins(
              color: AppColors.darkBlue,
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
