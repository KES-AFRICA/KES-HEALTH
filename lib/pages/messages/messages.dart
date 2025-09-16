import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/custom_toast.dart';
import 'package:kes_health/core/components/infocard.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/core/components/roundedbouton.dart';

@RoutePage()
class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  void _showNotAvailableToast(BuildContext context) {
    CustomToast.warning(
      context: context,
      title: 'Non disponible',
      description: 'Fonctionnalité en cours de développement.',
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.width;
    double sizedboxheaight = 0.03;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Mes messages',
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
              svgPath: 'assets/icons/svg/message.svg',
              title: 'Envoyez des demandes',
              sizedboxheaight: sizedboxheaight,
              subtitle:
                  'Vous pouvez envoyer à votre soignant des demandes spécifiques, sur des résultats d\'examen, des courriers d\'adressages ou autres',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            SizedBox(height: screenHeight*0.05),
            RoundedButton(
              text: 'Envoyer une demande', 
              color: AppColors.primaryBlue, 
              onPressed: ()=> _showNotAvailableToast(context)
              
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:kes_health/core/components/infocard.dart';
// import 'package:kes_health/core/constants/colors.dart';
// import 'package:kes_health/core/components/roundedbouton.dart';
// import 'package:kes_health/core/routing/app_router.dart';

// @RoutePage()
// class MessagesPage extends StatelessWidget {
//   const MessagesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.width;
//     double sizedboxheaight = 0.03;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           'Mes messages',
//           style: GoogleFonts.poppins(
//             fontWeight: FontWeight.w600,
//             color: AppColors.white,
//           ),
//         ),
//         backgroundColor: AppColors.primaryBlue,
//         elevation: 0,
//         foregroundColor: AppColors.primaryBlue,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InfoCard(
//               svgPath: 'assets/icons/svg/message.svg',
//               title: 'Envoyez des demandes',
//               sizedboxheaight: sizedboxheaight,
//               subtitle:
//                   'Vous pouvez envoyer à votre soignant des demandes spécifiques, sur des résultats d\'examen, des courriers d\'adressages ou autres',
//               screenWidth: screenWidth,
//               screenHeight: screenHeight,
//             ),
//             SizedBox(height: screenHeight*0.05),
//             RoundedButton(
//               text: 'Se connecter', 
//               color: AppColors.primaryBlue, 
//               onPressed: (){
//                 context.router.push(const ConnexionRoute());
//               }
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
