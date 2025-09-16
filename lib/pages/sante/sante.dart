import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/custom_toast.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/core/routing/app_router.dart';
import 'package:kes_health/pages/sante/components/buildcategorytile.dart';
import 'package:kes_health/pages/sante/components/rappelsantecard.dart';
import 'package:kes_health/pages/sante/data.dart';

@RoutePage()
class SantePage extends StatelessWidget {
  const SantePage({super.key});

  void _showNotAvailableToast(BuildContext context) {
    CustomToast.warning(
      context: context,
      title: 'Non disponible',
      description: 'Fonctionnalité en cours de développement.',
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Rappels santé',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => context.router.push(const RappelsSanteListRoute()),
            child: Text(
              'Voir tout (${healthReminders.length})',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section des cartes horizontales scrollables
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(16),
                itemCount: healthReminders.length,
                itemBuilder: (context, index) {
                  final reminder = healthReminders[index];
                  return HealthReminderCard(
                    title: reminder['title']!,
                    description: reminder['description']!,
                    imagePath: reminder['image']!,
                    onTap: () => _showNotAvailableToast(context),
                    onAppointmentPressed: () => _showNotAvailableToast(context),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Section Profil santé
            const _SectionTitle(title: 'Profil santé'),

            const SizedBox(height: 16),

            // Liste des catégories
            _buildHealthCategories(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthCategories(BuildContext context) {
    return Column(
      children: [
        buildCategoryTile(
          svgPath: 'assets/icons/svg/document.svg',
          iconColor: AppColors.primaryBlue,
          title: 'Documents',
          onTap: () => _showNotAvailableToast(context),
        ),
        buildCategoryTile(
          svgPath: 'assets/icons/svg/medical-history.svg',
          iconColor: AppColors.primaryBlue,
          title: 'Antécédents médicaux',
          onTap: () => _showNotAvailableToast(context),
        ),
        buildCategoryTile(
          svgPath: 'assets/icons/svg/pill.svg',
          iconColor: AppColors.primaryBlue,
          title: 'Traitements réguliers',
          onTap: () => _showNotAvailableToast(context),
        ),
        buildCategoryTile(
          svgPath: 'assets/icons/svg/allergie.svg',
          iconColor: AppColors.primaryBlue,
          title: 'Allergies',
          onTap: () => _showNotAvailableToast(context),
        ),
        buildCategoryTile(
          svgPath: 'assets/icons/svg/traitement.svg',
          iconColor: AppColors.primaryBlue,
          title: 'Antécédents familiaux',
          onTap: () => _showNotAvailableToast(context),
        ),
        buildCategoryTile(
          svgPath: 'assets/icons/svg/operation.svg',
          iconColor: AppColors.primaryBlue,
          title: 'Opérations chirurgicales',
          onTap: () => _showNotAvailableToast(context),
        ),
        buildCategoryTile(
          svgPath: 'assets/icons/svg/vaccin.svg',
          iconColor: AppColors.primaryBlue,
          title: 'Vaccinations',
          onTap: () => _showNotAvailableToast(context),
        ),
        buildCategoryTile(
          svgPath: 'assets/icons/svg/mesure.svg',
          iconColor: AppColors.primaryBlue,
          title: 'Mesures',
          onTap: () => _showNotAvailableToast(context),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

// Composant pour les titres de section
class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
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
// class SantePage extends StatelessWidget {
//   const SantePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.width;
//     double sizedboxheaight = 0.03;

//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         title: Text(
//           'Santé',
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
//               svgPath: 'assets/icons/svg/coeur.svg',
//               title: 'Gérez facilement votre santé',
//               sizedboxheaight: sizedboxheaight,
//               subtitle:
//                   'Retrouvez vos informations de santé et recevez des rappels de prévention personnalisées',
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
