import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/core/components/roundedbouton.dart';

class InfoSecuCard extends StatelessWidget {
  final Color backgroundColor;
  final String iconSvgPath;
  final String title;
  final Color? buttonColor;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? titleColor;
  final double? iconSize;

  const InfoSecuCard({
    super.key,
    required this.backgroundColor,
    required this.iconSvgPath,
    required this.title,
     this.buttonColor,
     this.buttonText,
     this.onButtonPressed,
    this.borderRadius = 6.0,
    this.padding,
    this.margin,
    this.titleColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final defaultPadding = EdgeInsets.all(screenWidth * 0.04);

    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        padding: padding ?? defaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row avec icône et texte
            Row(
              children: [
                // Icône SVG à gauche
                SvgPicture.asset(
                  iconSvgPath,
                  width: iconSize ?? screenWidth * 0.08,
                  height: iconSize ?? screenWidth * 0.08,
                ),
                SizedBox(width: screenWidth * 0.03),
                // Texte qui prend le reste de l'espace
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.036,
                      fontWeight: FontWeight.w600,
                      color: titleColor ?? AppColors.darkBlue,
                    ),
                  ),
                ),
              ],
            ),
            buttonText!=null ? SizedBox(height: screenWidth * 0.04):const SizedBox(),
            // Bouton qui prend toute la largeur
            buttonText!=null ? SizedBox(
              width: double.infinity,
              child: RoundedButton(
                text: buttonText!,
                color: buttonColor!,
                onPressed: onButtonPressed!,
              ),
            ):const SizedBox(),
          ],
        ),
      ),
    );
  }
}