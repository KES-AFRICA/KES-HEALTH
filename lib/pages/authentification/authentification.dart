import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/pages/authentification/components/cardauth.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      appBar: AppBar(
        title: Text(
          'Identification',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            context.router.pop();
          },
        ),
        ),
       
      
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          children: [
            // Titre principal
            Text(
              'Inscrivez-vous ou connectez-vous',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w600,
                color: AppColors.darkBlue,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: screenHeight * 0.01),
            
            // Première carte - Inscription
            CardAuth(
              text: 'Nouveau sur Kes Health ?',
              buttonText: 'S\'inscrire',
              buttonColor: AppColors.primaryBlue,
              onButtonPressed: () {
                // Ajouter votre logique de navigation ici
              },
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
            ),
            
            SizedBox(height: screenHeight * 0.01),
            
            // Deuxième carte - Connexion
            CardAuth(
              text: 'J\'ai déjà un compte Kes Health',
              buttonText: 'Se connecter',
              buttonColor: AppColors.warningYellow,
              onButtonPressed: () {
                // Ajouter votre logique de navigation ici
              },
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
            ),
            
            // Espaceur pour pousser le contenu vers le haut
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

