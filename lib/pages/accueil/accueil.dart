import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/badge.dart';
import 'package:kes_health/core/components/custom_toast.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/core/routing/app_router.dart';
import 'package:kes_health/pages/accueil/components/calltoactioncard.dart';
import 'package:kes_health/pages/accueil/components/card.dart';
import 'package:kes_health/core/components/infocard.dart';
import 'package:kes_health/pages/sante/components/rappelsantecard.dart';
import 'package:kes_health/pages/sante/data.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/icons/svg/h.svg',
          height: screenWidth * 0.08, // taille du logo
          colorFilter: const ColorFilter.mode(
            AppColors.white, // couleur blanche
            BlendMode.srcIn,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        foregroundColor: AppColors.primaryBlue,
        actions: [
          GestureDetector(
            onTap: () {
              //a mettre que quand on n'est pas connecté
              //context.router.push(const ConnexionRoute());
            },
            child: Row(
              children: [
                Text(
                 '',// mettre AppTexts.login que quand on n'est pas connecté
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: screenWidth * 0.04,
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
          color: AppColors.white,
          child: Column(
            children: [
              // Premier container avec fond bleu
              Container(
                height: screenHeight * 0.30,
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue, // ton primary (#27B7B7)
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Stack(
                  children: [
                    // Fond décoratif façon WhatsApp
                    const Positioned.fill(
                      child: Opacity(
                        opacity:
                            0.2, // faible opacité pour ne pas gêner le texte
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 40,
                          runSpacing: 40,
                          children: [
                            Icon(Icons.local_hospital,
                                size: 36, color: Colors.white),
                            Icon(Icons.medical_services,
                                size: 32, color: Colors.white),
                            Icon(Icons.vaccines, size: 34, color: Colors.white),
                            Icon(Icons.healing, size: 30, color: Colors.white),
                            Icon(Icons.health_and_safety,
                                size: 38, color: Colors.white),
                            Icon(Icons.bloodtype,
                                size: 32, color: Colors.white),
                            Icon(Icons.monitor_heart,
                                size: 34, color: Colors.white),
                            Icon(Icons.local_pharmacy,
                                size: 30, color: Colors.white),
                            Icon(Icons.local_hospital,
                                size: 36, color: Colors.white),
                            Icon(Icons.medical_services,
                                size: 32, color: Colors.white),
                            Icon(Icons.vaccines, size: 34, color: Colors.white),
                            Icon(Icons.healing, size: 30, color: Colors.white),
                            Icon(Icons.health_and_safety,
                                size: 38, color: Colors.white),
                            Icon(Icons.bloodtype,
                                size: 32, color: Colors.white),
                            Icon(Icons.monitor_heart,
                                size: 34, color: Colors.white),
                            Icon(Icons.local_pharmacy,
                                size: 30, color: Colors.white),
                            Icon(Icons.local_hospital,
                                size: 36, color: Colors.white),
                            Icon(Icons.medical_services,
                                size: 32, color: Colors.white),
                            Icon(Icons.vaccines, size: 34, color: Colors.white),
                            Icon(Icons.healing, size: 30, color: Colors.white),
                            Icon(Icons.health_and_safety,
                                size: 38, color: Colors.white),
                            Icon(Icons.bloodtype,
                                size: 32, color: Colors.white),
                            Icon(Icons.monitor_heart,
                                size: 34, color: Colors.white),
                            Icon(Icons.local_pharmacy,
                                size: 30, color: Colors.white),
                            Icon(Icons.local_hospital,
                                size: 36, color: Colors.white),
                            Icon(Icons.medical_services,
                                size: 32, color: Colors.white),
                            Icon(Icons.vaccines, size: 34, color: Colors.white),
                            Icon(Icons.healing, size: 30, color: Colors.white),
                            Icon(Icons.health_and_safety,
                                size: 38, color: Colors.white),
                            Icon(Icons.bloodtype,
                                size: 32, color: Colors.white),
                            Icon(Icons.monitor_heart,
                                size: 34, color: Colors.white),
                            Icon(Icons.local_pharmacy,
                                size: 30, color: Colors.white),
                          ],
                        ),
                      ),
                    ),

                    // Contenu principal
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Slogan
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05),
                            child: Text(
                              'Toute votre santé, au bout des doigts.',
                              style: GoogleFonts.poppins(
                                color: AppColors.white,
                                fontSize: screenWidth * 0.07,
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.02),

                          // Barre de recherche
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.20),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText:
                                    'Rechercher un médecin, un spécialiste...',
                                hintStyle: GoogleFonts.poppins(
                                  color:
                                      AppColors.textSecondary.withOpacity(0.7),
                                  fontSize: screenWidth * 0.037,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.primaryBlue.withOpacity(0.8),
                                  size: 24,
                                ),
                                filled: true,
                                fillColor: AppColors.white,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.018,
                                  horizontal: screenWidth * 0.04,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  borderSide: BorderSide(
                                    color:
                                        AppColors.primaryBlue.withOpacity(0.4),
                                    width: 1.2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  borderSide: const BorderSide(
                                    color: AppColors.primaryBlue,
                                    width: 1.8,
                                  ),
                                ),
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.037,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //  Carrousel
              Stack(
                clipBehavior:
                    Clip.none, // très important pour laisser dépasser l'ombre
                children: [
                  Container(
                    height: screenHeight * 0.14, // <-- hauteur réelle du fond
                  ),

                  // Carrousel "flottant"
                  Positioned(
                    top: -screenHeight * 0.06, // décalage vers le haut
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: screenHeight * 0.18,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: screenHeight * 0.18,
                          viewportFraction: 0.90,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: false,
                          padEnds: false,
                          autoPlay: false,
                        ),
                        items: [
                          buildCard(
                            'Médecin, psychologue ou psychiatre : comment choisir',
                            'assets/images/png/card1.png',
                            screenWidth,
                            screenHeight,
                          ),
                          buildCard(
                            'Tests santé : découvrez votre bilan personnalisé',
                            'assets/images/png/card2.png',
                            screenWidth,
                            screenHeight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Bouton soignant (à activer que quand on est connecté)
              // RoundedButton(
              //   text: 'Vous êtes soignant ?',
              //   color: AppColors.darkBlue,
              //   onPressed: () =>_showNotAvailableToast(context),
              // ),

              // Rappels santé

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      top: screenHeight * 0.01,
                    ),
                    child: Text(
                      'Rappels santé',
                      style: GoogleFonts.poppins(
                        color: AppColors.darkBlue,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: screenWidth * 0.05,
                      top: screenHeight * 0.02,
                    ),
                    child: AnimatedBadge(
                      text: 'En savoir plus',
                      textColor: AppColors.darkBlue,
                      onPressed: () => context.router.push(const RappelsSanteListRoute()),
                    ),
                  ),
                ],
              ),
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

              SizedBox(height: screenHeight * 0.02),
              // Texte
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  'Votre compagnon santé au quotidien',
                  style: GoogleFonts.poppins(
                    color: AppColors.darkBlue,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                  textAlign: TextAlign.center, // <--- centrage
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              InfoCard(
                svgPath: 'assets/icons/svg/calendrier2.svg',
                title: 'Accédez aux soins plus facilement',
                subtitle:
                    'Réservez des consultations vidéo ou en présentiel, et recevez des rappels pour ne jamais les manquer.',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(height: screenHeight * 0.04),
              InfoCard(
                svgPath: 'assets/icons/svg/message.svg',
                title: 'Bénéficiez de soins personnalisés',
                subtitle:
                    'Échangez avec vos soignants par message, obtenez des conseils préventifs et recevez des soins quand vous en avez besoin.',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(height: screenHeight * 0.04),
              InfoCard(
                svgPath: 'assets/icons/svg/coeur.svg',
                title: 'Gérez votre santé',
                subtitle:
                    'Rassemblez facilement toutes vos informations de santé et celles de ceux qui comptent pour vous.',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),

              //statistiquue
              // SizedBox(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         AppTexts.appName,
              //         style: GoogleFonts.poppins(
              //           color: AppColors.darkBlue,
              //           fontSize: screenWidth * 0.06,
              //           fontWeight: FontWeight.w700,
              //           height: 1.4,
              //         ),
              //         textAlign: TextAlign.center, // <--- centrage
              //       ),
              //       Text(
              //         " en chiffres",
              //         style: GoogleFonts.poppins(
              //           color: AppColors.darkBlue,
              //           fontSize: screenWidth * 0.05,
              //           fontWeight: FontWeight.w600,
              //           height: 1.2,
              //         ),
              //         textAlign: TextAlign.center, // <--- centrage
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: screenHeight * 0.02),
              // InfoText(
              //   title: '80 millions',
              //   subtitle: 'de personnes mieux soignées',
              //   screenWidth: screenWidth,
              //   screenHeight: screenHeight,
              // ),
              // SizedBox(height: screenHeight * 0.04),
              // InfoText(
              //   title: '400 000',
              //   subtitle: 'soignants utilisant Kes Health',
              //   screenWidth: screenWidth,
              //   screenHeight: screenHeight,
              // ),
              // SizedBox(height: screenHeight * 0.04),
              // InfoText(
              //   title: '9 millions',
              //   subtitle: 'de documents partagés chaque mois',
              //   screenWidth: screenWidth,
              //   screenHeight: screenHeight,
              // ),
              //
              SizedBox(height: screenHeight * 0.04),
              CallToActionCard(
                imageUrl: 'assets/images/jpg/image1.jpg',
                title: 'Votre santé. Vos données.',
                subtitle:
                    'La confidentialité de vos informations personnelles est une priorité absolue pour Kes Health et guide notre action quotidien',
                buttonText: 'Découvrir nos engagements',
                onButtonPressed: () => _showNotAvailableToast(context),
              ),
              SizedBox(height: screenHeight * 0.02),
              CallToActionCard(
                imageUrl: 'assets/images/jpg/image2.jpg',
                title: 'Vous etes soignant ?',
                subtitle:
                    'Découvrez Kes Health pour les soignants et améliorez votre quotidien',
                buttonText: 'En savoir plus',
                onButtonPressed: () => _showNotAvailableToast(context),
              ),
              SizedBox(height: screenHeight * 0.02),
              CallToActionCard(
                imageUrl: 'assets/images/jpg/image3.jpg',
                title: 'Un rendez-vous ?',
                subtitle:
                    'Découvrez la liste de nos spécialiste en fonction de votre problème',
                buttonText: 'Consultez',
                onButtonPressed: () => _showNotAvailableToast(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
