import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/pages/rendezvous/components/pastappointments.dart';
import 'package:kes_health/pages/rendezvous/components/upcomingappointments.dart';

@RoutePage()
class RendezVousPage extends StatefulWidget {
  const RendezVousPage({super.key});

  @override
  State<RendezVousPage> createState() => _RendezVousPageState();
}

class _RendezVousPageState extends State<RendezVousPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        foregroundColor: AppColors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            color: AppColors.blueGreyBackground,
            child: TabBar(
              controller: _tabController,
              indicator: const BoxDecoration(
                color: Colors.transparent, // pas de fond supplémentaire
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.darkBlue, // ligne d’indicateur darkBlue
                    width: 3.0,
                  ),
                ),
              ),
              labelColor: AppColors.darkBlue, // texte actif = darkBlue
              unselectedLabelColor:
                  AppColors.darkBlue, // texte inactif = secondaryBlue
              labelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              tabs: const [
                Tab(text: 'À venir'),
                Tab(text: 'Passés'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab "À venir"
          buildUpcomingAppointments(context),

          // Tab "Passés"
          buildPastAppointments(context),
        ],
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
// class RendezVousPage extends StatelessWidget {
//   const RendezVousPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.width;
//     double sizedboxheaight = 0.03;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           'Mes rendez-vous',
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
//               svgPath: 'assets/icons/svg/calendrier2.svg',
//               title: 'Planifiez vos rendez-vous',
//               sizedboxheaight: sizedboxheaight,
//               subtitle:
//                   'Trouvez un professionel de la santé et prenez rendez-vous en ligne à tout moment',
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
