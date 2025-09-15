import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/infocard.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/core/components/roundedbouton.dart';
import 'package:kes_health/core/routing/app_router.dart';

@RoutePage()
class SantePage extends StatelessWidget {
  const SantePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.width;
    double sizedboxheaight = 0.03;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Santé',
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
              svgPath: 'assets/icons/svg/coeur.svg',
              title: 'Gérez facilement votre santé',
              sizedboxheaight: sizedboxheaight,
              subtitle:
                  'Retrouvez vos informations de santé et recevez des rappels de prévention personnalisées',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            SizedBox(height: screenHeight*0.05),
            RoundedButton(
              text: 'Se connecter', 
              color: AppColors.primaryBlue, 
              onPressed: (){
                context.router.push(const AuthRoute());
              }
            )
          ],
        ),
      ),
    );
  }
}
