import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/roundedbouton.dart';

class CallToActionCard extends StatelessWidget {
  final String? imageUrl;
  final Widget? customImage;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;

  const CallToActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onButtonPressed,
    this.imageUrl,
    this.customImage,
    this.borderRadius = 8.0,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          children: [
            // === Image de fond ===
            Positioned.fill(
              child: _buildBackgroundImage(),
            ),

            // === Dégradé sombre du bas vers le milieu ===
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // === Contenu (titre, description, bouton) ===
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  RoundedButton(
                    text: buttonText,
                    color: Colors.tealAccent.shade400,
                    onPressed: onButtonPressed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    if (customImage != null) {
      return FittedBox(fit: BoxFit.cover, child: customImage!);
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      if (imageUrl!.startsWith('http')) {
        return Image.network(
          imageUrl!,
          fit: BoxFit.cover,
        );
      } else {
        return Image.asset(
          imageUrl!,
          fit: BoxFit.cover,
        );
      }
    } else {
      return Container(color: Colors.grey.shade300);
    }
  }
}
