import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/core/constants/texte.dart';
import 'package:kes_health/pages/accueil/accueil.dart';
import 'dart:async';

import 'package:kes_health/pages/carrousel_slider/components/Slide.dart';
import 'package:kes_health/pages/navigations/navigation.dart';

class Carroussel extends StatefulWidget {
  const Carroussel({super.key});

  @override
  State<Carroussel> createState() => _CarrousselState();
}

class _CarrousselState extends State<Carroussel> with TickerProviderStateMixin {
  late PageController _pageController;
  late Timer _timer;
  late List<AnimationController> _progressControllers;
  int _currentIndex = 0;
  static const int _slideDuration = 4; // 4 secondes par slide

  // Données des slides
  final List<SlideData> _slides = [
    SlideData(
      description:
          'Prenez soin de votre santé avec notre application innovante',
      imagePath: 'assets/images/png/slider1.png',
      icon: Icons.health_and_safety,
    ),
    SlideData(
      description:
          'Suivez vos rendez-vous médicaux et vos traitements facilement',
      imagePath: 'assets/images/png/slider2.png',
      icon: Icons.calendar_month,
    ),
    SlideData(
      description: 'Accédez à votre historique médical en toute sécurité',
      imagePath: 'assets/images/png/slider3.png',
      icon: Icons.folder_shared,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _progressControllers = List.generate(
      _slides.length,
      (index) => AnimationController(
        duration: const Duration(seconds: _slideDuration),
        vsync: this,
      ),
    );

    _startSlideShow();
  }

  void _startSlideShow() {
    _progressControllers[_currentIndex].forward();

    _timer = Timer.periodic(const Duration(seconds: _slideDuration), (timer) {
      if (_currentIndex < _slides.length - 1) {
        _nextSlide();
      } else {
        _resetSlideShow();
      }
    });
  }

  void _nextSlide() {
    setState(() {
      _currentIndex++;
    });
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _progressControllers[_currentIndex].forward();
  }

  void _resetSlideShow() {
    setState(() {
      _currentIndex = 0;
    });
    for (var controller in _progressControllers) {
      controller.reset();
    }
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _progressControllers[0].forward();
  }

  void _onSlideChanged(int index) {
    if (index != _currentIndex) {
      setState(() {
        _progressControllers[_currentIndex].reset();
        _currentIndex = index;
        _progressControllers[_currentIndex].forward();
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    for (var controller in _progressControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.ultraLightBlueBackground,
              AppColors.ultraLightBlueBackground,
            ],
          ),
        ),
        child: Column(
          children: [
            // Container du haut avec les slides
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.06),

                  // Barres de progression
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    height: screenHeight * 0.005,
                    child: Row(
                      children: List.generate(
                        _slides.length,
                        (index) => Expanded(
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                            child: AnimatedBuilder(
                              animation: _progressControllers[index],
                              builder: (context, child) {
                                return Container(
                                  height: screenHeight * 0.005,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppColors.textSecondary.withOpacity(0.3),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(2),
                                    child: LinearProgressIndicator(
                                      value: index == _currentIndex
                                          ? _progressControllers[index].value
                                          : (index < _currentIndex ? 1.0 : 0.0),
                                      backgroundColor: Colors.transparent,
                                      valueColor: const AlwaysStoppedAnimation<Color>(
                                        AppColors.darkBlue,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Nom de l'application (Poppins)
                  Text(
                    AppTexts.appName,
                    style: GoogleFonts.pacifico(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // PageView des slides
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: _onSlideChanged,
                      itemCount: _slides.length,
                      itemBuilder: (context, index) {
                        return SlideComponent(slideData: _slides[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Container du bas fixe
            Container(
              height: screenHeight * 0.35,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.06),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Indicateurs de pagination
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _slides.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin:
                              EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                          width: _currentIndex == index
                              ? screenWidth * 0.03
                              : screenWidth * 0.02,
                          height: _currentIndex == index
                              ? screenWidth * 0.03
                              : screenWidth * 0.02,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? AppColors.primaryBlue
                                : AppColors.borderLight,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Bouton principal
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.065,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigation vers la page d'accueil (même action)
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const NavigationScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          foregroundColor: AppColors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          AppTexts.getStarted,
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    // Bouton secondaire
                    TextButton(
                      onPressed: () {
                        // Navigation vers la page d'accueil (même action)
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const NavigationScreen()),
                          );
                      },
                      child: Text(
                        AppTexts.skipIntro,
                        style: GoogleFonts.poppins(
                          color: AppColors.textSecondary,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
