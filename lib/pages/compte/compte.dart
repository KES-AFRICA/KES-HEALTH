import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/core/constants/texte.dart';
import 'package:kes_health/core/routing/app_router.dart';
import 'package:kes_health/pages/compte/components/buildconfidentialitysection.dart';
import 'package:kes_health/pages/compte/components/buildparameterssection.dart';
import 'package:kes_health/pages/compte/components/infosecucard.dart';

@RoutePage()
class ComptePage extends StatelessWidget {
  const ComptePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height; // Correction: height au lieu de width
    final defaultPadding = EdgeInsets.all(screenWidth * 0.04);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Connexion',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        foregroundColor: AppColors.primaryBlue,
        actions: [
          GestureDetector(
            onTap: () {
              // Action à effectuer lors du tap sur l'icône d'aide
            },
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.white),
                const SizedBox(width: 6),
                Text(
                  'Aide',
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: defaultPadding,
          child: Column(
            children: [
              InfoSecuCard(
                margin: EdgeInsets.zero,
                backgroundColor: AppColors.lightBlueBackground,
                iconSvgPath: 'assets/icons/svg/security.svg',
                title: 'Kes Health est au service de votre santé et celle de vos proches',
                buttonColor: AppColors.primaryBlue,
                buttonText: 'Se connecter',
                onButtonPressed: () => {
                  context.router.push(const AuthRoute())
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Vous n\'avez pas de compte ?',
                    style: GoogleFonts.poppins(
                      color: AppColors.darkBlue,
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  GestureDetector(
                    onTap: () {
                      // Action à effectuer lors du tap sur "S'inscrire"
                      context.router.push( const AuthRoute());
                    },
                    child: Text(
                      'S\'inscrire',
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryBlue,
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              
              // ParametersSection
              SizedBox(height: screenHeight * 0.04),
              buildParametersSection(context, screenWidth),
              
              // ConfidentialitySection
              SizedBox(height: screenHeight * 0.03),
              buildConfidentialitySection(context, screenWidth),
              
              // Version
              SizedBox(height: screenHeight * 0.04),
              Text(
                AppTexts.version,
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade600,
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}