
// password_step_component.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/roundedbouton.dart';
import 'package:kes_health/core/constants/colors.dart';

class PasswordStepComponent extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onContinue;

  const PasswordStepComponent({
    Key? key,
    required this.controller,
    required this.onContinue,
  }) : super(key: key);

  @override
  State<PasswordStepComponent> createState() => _PasswordStepComponentState();
}

class _PasswordStepComponentState extends State<PasswordStepComponent> {
  bool _hasError = false;
  bool _obscureText = true;

  bool _isValidPassword(String password) {
    return password.length >= 8 && 
           RegExp(r'^(?=.*[A-Za-z])(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$').hasMatch(password);
  }

  String _getPasswordStrength(String password) {
    if (password.isEmpty) return '';
    if (password.length < 6) return 'Faible';
    if (password.length < 8 || !RegExp(r'[A-Za-z]').hasMatch(password) || !RegExp(r'[@$!%*#?&]').hasMatch(password)) {
      return 'Moyen';
    }
    return 'Fort';
  }

  Color _getPasswordStrengthColor(String strength) {
    switch (strength) {
      case 'Faible':
        return Colors.red;
      case 'Moyen':
        return Colors.orange;
      case 'Fort':
        return AppColors.successGreen;
      default:
        return AppColors.textSecondary;
    }
  }

  void _validate() {
    setState(() {
      _hasError = !_isValidPassword(widget.controller.text);
    });
    
    if (!_hasError) {
      widget.onContinue();
    }
  }

  @override
  Widget build(BuildContext context) {
    final passwordStrength = _getPasswordStrength(widget.controller.text);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'S\'inscrire',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Définissez votre mot de passe',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Votre mot de passe doit comporter au moins 8 caractères. Il doit contenir des lettres et au moins un caractère spécial.',
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Mot de passe',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
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
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.textSecondary,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
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
              setState(() {
                if (_hasError) {
                  _hasError = false;
                }
              });
            },
          ),
          if (_hasError) ...[
            const SizedBox(height: 8),
            Text(
              'Le mot de passe doit contenir au moins 8 caractères, des lettres et un caractère spécial',
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
          ],
          const SizedBox(height: 16),
          if (widget.controller.text.isNotEmpty && passwordStrength.isNotEmpty) ...[
            Text(
              'Niveau de sécurité : $passwordStrength',
              style: GoogleFonts.poppins(
                color: _getPasswordStrengthColor(passwordStrength),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(height: 1, color: AppColors.borderLight),
          ],
          const SizedBox(height: 24),
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
