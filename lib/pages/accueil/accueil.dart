import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/custom_toast.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/core/constants/texte.dart';
import 'package:kes_health/core/routing/app_router.dart';
import 'package:kes_health/pages/accueil/components/calltoactioncard.dart';
import 'package:kes_health/pages/accueil/components/card.dart';
import 'package:kes_health/core/components/infocard.dart';
import 'package:kes_health/pages/accueil/components/infotext.dart';
import 'package:kes_health/core/components/roundedbouton.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTexts.appNameShort,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        foregroundColor: AppColors.primaryBlue,
        actions: [
          GestureDetector(
            onTap: () {
              context.router.push(const ConnexionRoute());
            },
            child: Row(
              children: [
                Text(
                  AppTexts.login,
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
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Stack(
                  children: [
                    // Image décorative en fond
                    Positioned(
                      bottom: -30,
                      right: 0,
                      child: Opacity(
                        opacity: 0.9,
                        child: Image.asset(
                          'assets/images/png/home_illustration.png',
                          width: screenWidth * 0.6,
                          height: screenHeight * 0.25,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // Contenu
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Slogan
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05),
                            child: Text(
                              'Vivez en meilleure santé',
                              style: GoogleFonts.poppins(
                                color: AppColors.white,
                                fontSize: screenWidth * 0.07,
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center, // <--- centrage
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

              // Bouton soignant
              RoundedButton(
                text: 'Vous êtes soignant ?',
                color: AppColors.darkBlue,
                onPressed: () {
                  // Toast d'avertissement
                  CustomToast.warning(
                    context: context,
                    title: 'Non disponible',
                    description: 'Fonctionnalité en cours de développement.',
                  );
                },
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
              SizedBox(height: screenHeight * 0.08),

              //statistiquue
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppTexts.appName,
                      style: GoogleFonts.poppins(
                        color: AppColors.darkBlue,
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center, // <--- centrage
                    ),
                    Text(
                      " en chiffres",
                      style: GoogleFonts.poppins(
                        color: AppColors.darkBlue,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center, // <--- centrage
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              InfoText(
                title: '80 millions',
                subtitle: 'de personnes mieux soignées',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(height: screenHeight * 0.04),
              InfoText(
                title: '400 000',
                subtitle: 'soignants utilisant Kes Health',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(height: screenHeight * 0.04),
              InfoText(
                title: '9 millions',
                subtitle: 'de documents partagés chaque mois',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(height: screenHeight * 0.06),
              CallToActionCard(
                backgroundColor: AppColors.lightBlueBackground,
                imageUrl: 'assets/images/png/slider1.png',
                title: 'Votre santé. Vos données.',
                titleColor: AppColors.darkBlue,
                subtitle:
                    'La confidentialité de vos informations personnelles est une priorité absolue pour Kes Health et guide notre action quotidien',
                subtitleColor: AppColors.darkBlue,
                buttonText: 'Découvrir nos engagements',
                buttonColor: Colors.blue, // OBLIGATOIRE
                onButtonPressed: () => {
                  CustomToast.warning(
                    context: context,
                    title: 'Non disponible',
                    description: 'Fonctionnalité en cours de développement.',
                  )
                },
                elementOrder: const [
                  CardElementType.image,
                  CardElementType.title,
                  CardElementType.subtitle,
                  CardElementType.button,
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              CallToActionCard(
                backgroundColor: AppColors.darkBlue,
                imageUrl: 'assets/images/png/slider2.png',
                title: 'Vous etes soignant ?',
                titleColor: AppColors.white,
                subtitle:
                    'Découvrez Kes Health pour les soignants et améliorez votre quotidien',
                subtitleColor: AppColors.white,
                buttonText: 'En savoir plus',
                buttonColor: Colors.blue, // OBLIGATOIRE
                onButtonPressed: () => {
                  CustomToast.warning(
                    context: context,
                    title: 'Non disponible',
                    description: 'Fonctionnalité en cours de développement.',
                  )
                },
                elementOrder: const [
                  CardElementType.image,
                  CardElementType.title,
                  CardElementType.subtitle,
                  CardElementType.button,
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              CallToActionCard(
                backgroundColor: AppColors.lightBlueBackground,
                imageUrl: 'assets/images/png/slider3.png',
                title: 'Un rendez-vous ?',
                titleColor: AppColors.darkBlue,
                subtitle:
                    'Découvrez la liste de nos spécialiste en fonction de votre problème',
                subtitleColor: AppColors.darkBlue,
                buttonText: 'Consultez',
                buttonColor: Colors.blue, // OBLIGATOIRE
                onButtonPressed: () => {
                  CustomToast.warning(
                    context: context,
                    title: 'Non disponible',
                    description: 'Fonctionnalité en cours de développement.',
                  )
                },
                elementOrder: const [
                  CardElementType.title,
                  CardElementType.subtitle,
                  CardElementType.button,
                  CardElementType.image,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
