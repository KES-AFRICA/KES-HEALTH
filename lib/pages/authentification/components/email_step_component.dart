
// email_step_component.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/roundedbouton.dart';
import 'package:kes_health/core/constants/colors.dart';

class EmailStepComponent extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onContinue;

  const EmailStepComponent({
    Key? key,
    required this.controller,
    required this.onContinue,
  }) : super(key: key);

  @override
  State<EmailStepComponent> createState() => _EmailStepComponentState();
}

class _EmailStepComponentState extends State<EmailStepComponent> {
  bool _hasError = false;

  bool _isValidEmailOrPhone(String value) {
    // Validation email
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    // Validation téléphone (format français)
    final phoneRegex = RegExp(r'^[6-7]\d{8}$|^0[6-7]\d{8}$|^\+33[6-7]\d{8}$');
    
    return emailRegex.hasMatch(value) || phoneRegex.hasMatch(value.replaceAll(' ', ''));
  }

  void _validate() {
    setState(() {
      _hasError = !_isValidEmailOrPhone(widget.controller.text.trim());
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
            'Saisissez votre adresse email ou votre numéro de téléphone',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Adresse e-mail ou numéro de téléphone',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: 'Ex : nom@email.com ou 655 123 456',
              hintStyle: GoogleFonts.poppins(
                color: AppColors.textSecondary,
              ),
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
            keyboardType: TextInputType.emailAddress,
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
              'Veuillez saisir une adresse email ou un numéro de téléphone valide',
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
          ],
          const SizedBox(height: 40),
          RoundedButton(
            text: 'CONTINUER',
            color: AppColors.primaryBlue,
            onPressed: _validate,
          ),
        ],
      ),
    );
  }
}
