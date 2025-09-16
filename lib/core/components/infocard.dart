import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';

class InfoCard extends StatelessWidget {
  final String svgPath;
  final String title;
  final double? sizedboxheaight;
  final String subtitle;
  final double screenWidth;
  final double screenHeight;

  const InfoCard({
    super.key,
    required this.svgPath,
    required this.title,
    this.sizedboxheaight,
    required this.subtitle,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image SVG
        SizedBox(
          child: Center(
            child: SvgPicture.asset(
              svgPath,
              width: screenWidth * 0.25,
              height: screenWidth * 0.25,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        // Texte principal
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: AppColors.black.withOpacity(0.75),
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        //espacement
        if (sizedboxheaight != null)
          SizedBox(height: screenHeight*sizedboxheaight!),
        // Sous-texte
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Text(
            subtitle,
            style: GoogleFonts.poppins(
              color: Colors.grey.shade600,
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
