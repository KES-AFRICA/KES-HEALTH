import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/infocard.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/pages/accueil/components/roundedbouton.dart';

class RendezVousPage extends StatelessWidget {
  const RendezVousPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.width;
    double sizedboxheaight = 0.03;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Mes rendez-vous',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        foregroundColor: AppColors.primaryBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InfoCard(
              svgPath: 'assets/icons/svg/calendrier.svg',
              title: 'Planifiez vos rendez-vous',
              sizedboxheaight: sizedboxheaight,
              subtitle:
                  'Trouvez un professionel de la santé et prenez rendez-vous en ligne à tout moment',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            SizedBox(height: screenHeight*0.05),
            RoundedButton(
              text: 'Se connecter', 
              color: AppColors.primaryBlue, 
              onPressed: (){}
            )
          ],
        ),
      ),
    );
  }
}
