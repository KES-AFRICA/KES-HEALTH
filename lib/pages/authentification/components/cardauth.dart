import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/core/components/roundedbouton.dart';

class CardAuth extends StatelessWidget {
  final String text;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onButtonPressed;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? textColor;
  final double? fontSize;

  const CardAuth({
    super.key,
    required this.text,
    required this.buttonText,
    required this.buttonColor,
    required this.onButtonPressed,
    this.borderRadius = 4.0,
    this.padding,
    this.margin,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final defaultPadding = EdgeInsets.all(screenWidth * 0.05);

    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: padding ?? defaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Texte principal
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: fontSize ?? screenWidth * 0.04,
                fontWeight: FontWeight.w500,
                color: textColor ?? AppColors.darkBlue,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenWidth * 0.02),
            // Bouton qui prend toute la largeur
            SizedBox(
              width: double.infinity,
              child: RoundedButton(
                text: buttonText,
                color: buttonColor,
                onPressed: onButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}