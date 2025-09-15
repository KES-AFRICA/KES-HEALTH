import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/custom_toast.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/core/routing/app_router.dart';
import 'package:kes_health/pages/authentification/inscription/components/conditions_step_component.dart';
import 'package:kes_health/pages/authentification/components/email_step_component.dart';
import 'package:kes_health/pages/authentification/inscription/components/identity_step_component.dart';
import 'package:kes_health/pages/authentification/components/password_step_component.dart';
import 'package:kes_health/pages/authentification/inscription/components/phone_step_component.dart';
import 'package:kes_health/pages/authentification/inscription/components/step_progress_indicator.dart';

@RoutePage()
class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  int _currentStep = 0; // commence à 0 pour correspondre à PageView
  final PageController _pageController = PageController();

  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  // Form states
  String? _selectedGender;
  bool _acceptConditions = false;

  // Nombre total d'étapes
  final int _totalSteps = 5;

  void _goToNextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.router.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: _goToPreviousStep,
        ),
        title: Text(
          'S\'inscrire',
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Barre de progression
          StepProgressIndicator(
            currentStep: _currentStep + 1, // +1 pour l'affichage humain
            totalSteps: _totalSteps,
          ),
          // Contenu des étapes
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _totalSteps,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return EmailStepComponent(
                      controller: _emailController,
                      onContinue: _goToNextStep,
                    );
                  case 1:
                    return IdentityStepComponent(
                      email: _emailController.text,
                      firstNameController: _firstNameController,
                      lastNameController: _lastNameController,
                      birthDateController: _birthDateController,
                      selectedGender: _selectedGender,
                      onGenderChanged: (gender) =>
                          setState(() => _selectedGender = gender),
                      onContinue: _goToNextStep,
                    );
                  case 2:
                    return PasswordStepComponent(
                      controller: _passwordController,
                      onContinue: _goToNextStep,
                    );
                  case 3:
                    return PhoneStepComponent(
                      controller: _phoneController,
                      onContinue: _goToNextStep,
                    );
                  case 4:
                    return ConditionsStepComponent(
                      acceptConditions: _acceptConditions,
                      onConditionsChanged: (value) =>
                          setState(() => _acceptConditions = value),
                      onContinue: () {
                        CustomToast.success(
                          context: context,
                          title: 'Inscription réussie',
                        );
                        context.router.replaceAll([const NavigationRoute()]);
                      },
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
