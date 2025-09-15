
// phone_step_component.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/roundedbouton.dart';
import 'package:kes_health/core/constants/colors.dart';

class PhoneStepComponent extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onContinue;

  const PhoneStepComponent({
    Key? key,
    required this.controller,
    required this.onContinue,
  }) : super(key: key);

  @override
  State<PhoneStepComponent> createState() => _PhoneStepComponentState();
}

class _PhoneStepComponentState extends State<PhoneStepComponent> {
  bool _hasError = false;

  bool _isValidPhone(String phone) {
    // Format : 6XXXXXXXX, 06XXXXXXXX, +336XXXXXXXX
    final phoneRegex = RegExp(r'^(?:(?:\+237)[67]|[67])\d{8}$');
    return phoneRegex.hasMatch(phone.replaceAll(' ', ''));
  }

  void _validate() {
    setState(() {
      _hasError = !_isValidPhone(widget.controller.text.trim());
    });
    
    if (!_hasError) {
      widget.onContinue();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saisissez votre numéro de téléphone',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Numéro de téléphone',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ex : 655 123 456',
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: _hasError ? Colors.red : AppColors.borderMedium,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: _hasError ? Colors.red : AppColors.primaryBlue,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: _hasError ? Colors.red : AppColors.borderMedium,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
            onChanged: (_) {
              if (_hasError) {
                setState(() {
                  _hasError = false;
                });
              }
            },
          ),
          if (_hasError) ...[
            const SizedBox(height: 8),
            Text(
              'Veuillez saisir un numéro de téléphone valide',
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
          ],
          const SizedBox(height: 16),
          Text(
            'Pour confirmer ce numéro, nous allons vous envoyer un code à 3 chiffres par SMS. Ce numéro sera utilisé pour la double authentification et les rappels de vos rendez-vous.',
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 40),
          RoundedButton(
            text: 'CONTINUER',
            color: AppColors.primaryBlue,
            onPressed: _validate,
          ),
        ]
      )
    );
  }
}