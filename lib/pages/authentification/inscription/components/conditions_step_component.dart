
// conditions_step_component.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/roundedbouton.dart';
import 'package:kes_health/core/constants/colors.dart';

class ConditionsStepComponent extends StatefulWidget {
  final bool acceptConditions;
  final Function(bool) onConditionsChanged;
  final VoidCallback onContinue;

  const ConditionsStepComponent({
    Key? key,
    required this.acceptConditions,
    required this.onConditionsChanged,
    required this.onContinue,
  }) : super(key: key);

  @override
  State<ConditionsStepComponent> createState() => _ConditionsStepComponentState();
}

class _ConditionsStepComponentState extends State<ConditionsStepComponent> {
  bool _hasError = false;

  void _validate() {
    setState(() {
      _hasError = !widget.acceptConditions;
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
            'S\'inscrire',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Conditions d\'utilisation et Politique de protection des données personnelles',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Pour créer un compte Kes health, veuillez accepter les Conditions générales d\'utilisation.',
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              widget.onConditionsChanged(!widget.acceptConditions);
              if (_hasError) {
                setState(() {
                  _hasError = false;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: _hasError ? Border.all(color: Colors.red, width: 1.5) : null,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: _hasError
                            ? Colors.red
                            : (widget.acceptConditions
                                ? AppColors.primaryBlue
                                : AppColors.borderMedium),
                        width: 1.5,
                      ),
                      color: widget.acceptConditions
                          ? AppColors.primaryBlue
                          : Colors.transparent,
                    ),
                    child: widget.acceptConditions
                        ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'J\'ai lu et j\'accepte les Conditions d\'utilisation',
                      style: GoogleFonts.poppins(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_hasError) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 36),
              child: Text(
                'Vous devez accepter les conditions d\'utilisation pour continuer',
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ),
          ],
          const SizedBox(height: 24),
          Text(
            'Votre adresse e-mail peut être utilisée par Kes health pour vous envoyer des communications relatives aux nouvelles fonctionnalités de Kes health. Vous pouvez vous opposer à cet envoi à tout moment, dans les paramètres de votre compte ou dans le pied de page de chaque e-mail. Pour plus d\'informations, consultez notre Politique de protection des données.',
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 40),
          RoundedButton(
            text: 'CONTINUER',
            color: widget.acceptConditions ? AppColors.primaryBlue : AppColors.borderMedium,
            onPressed: _validate,
          ),
        ],
      ),
    );
  }
}

