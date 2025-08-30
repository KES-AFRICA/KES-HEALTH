import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';

class SlideData {
  final String description;
  final String imagePath; // chemin/lien vers l'image SVG
  final IconData? icon; // optionnel si pas d'image

  SlideData({
    required this.description,
    required this.imagePath,
    this.icon,
  });
}

// Composant réutilisable pour chaque slide
class SlideComponent extends StatelessWidget {
  final SlideData slideData;

  const SlideComponent({
    super.key,
    required this.slideData,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;
        final responsiveSize = (maxWidth < maxHeight ? maxWidth : maxHeight);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Texte description
              Text(
                slideData.description,
                style: GoogleFonts.poppins(
                  fontSize: responsiveSize * 0.05,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkBlue,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: maxHeight * 0.07),

              /// Image / Icône
              SizedBox(
                    width: responsiveSize * 0.8,
                    height: responsiveSize * 0.7,
                    child: Image.asset(
                      slideData.imagePath, // Exemple : "assets/images/slide1.png"
                      width: responsiveSize * 0.6,  // remplit le SizedBox
                      height: responsiveSize * 0.5,
                      fit: BoxFit.contain,           // s'assure que l'image est entièrement visible
                    ),
                  )

            ],
          ),
        );
      },
    );
  }
}
