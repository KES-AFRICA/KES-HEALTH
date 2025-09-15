// identity_step_component.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/pages/authentification/components/dateinputformatter.dart';
import 'package:kes_health/core/components/roundedbouton.dart';
import 'package:kes_health/core/constants/colors.dart';

class IdentityStepComponent extends StatefulWidget {
  final String email;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthDateController;
  final String? selectedGender;
  final Function(String) onGenderChanged;
  final VoidCallback onContinue;

  const IdentityStepComponent({
    Key? key,
    required this.email,
    required this.firstNameController,
    required this.lastNameController,
    required this.birthDateController,
    required this.selectedGender,
    required this.onGenderChanged,
    required this.onContinue,
  }) : super(key: key);

  @override
  State<IdentityStepComponent> createState() => _IdentityStepComponentState();
}

class _IdentityStepComponentState extends State<IdentityStepComponent> {
  final Map<String, bool> _fieldErrors = {
    'gender': false,
    'firstName': false,
    'lastName': false,
    'birthDate': false,
  };

  bool _isValidDate(String date) {
    final dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!dateRegex.hasMatch(date)) return false;

    try {
      final parts = date.split('/');
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      final parsedDate = DateTime(year, month, day);
      final now = DateTime.now();

      return parsedDate.isBefore(now) &&
          year > 1900 &&
          month >= 1 &&
          month <= 12 &&
          day >= 1 &&
          day <= 31;
    } catch (e) {
      return false;
    }
  }

  bool _isValidName(String name) {
    // Use a simpler pattern for name validation to avoid RegExp issues with non-ASCII characters
    return name.trim().length >= 2 &&
        RegExp(r"^[a-zA-Z\s\-']+$").hasMatch(name.trim());
  }

  void _validate() {
    setState(() {
      _fieldErrors['gender'] = widget.selectedGender == null;
      _fieldErrors['firstName'] =
          !_isValidName(widget.firstNameController.text);
      _fieldErrors['lastName'] = !_isValidName(widget.lastNameController.text);
      _fieldErrors['birthDate'] =
          !_isValidDate(widget.birthDateController.text);
    });

    if (!_fieldErrors.values.any((hasError) => hasError)) {
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
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '2. ',
                  style: GoogleFonts.poppins(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: widget.email,
                  style: GoogleFonts.poppins(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Renseignez votre identité',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tous les champs sont obligatoires.',
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Civilité',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildGenderOption('Féminin', 'F'),
              const SizedBox(width: 16),
              _buildGenderOption('Masculin', 'M'),
            ],
          ),
          if (_fieldErrors['gender']!) ...[
            const SizedBox(height: 8),
            Text(
              'Veuillez sélectionner votre civilité',
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
          ],
          const SizedBox(height: 24),
          _buildFormField(
            'Prénom',
            widget.firstNameController,
            _fieldErrors['firstName']!,
            'Veuillez saisir un prénom valide (au moins 2 caractères)',
          ),
          const SizedBox(height: 16),
          _buildFormField(
            'Nom',
            widget.lastNameController,
            _fieldErrors['lastName']!,
            'Veuillez saisir un nom valide (au moins 2 caractères)',
          ),
          const SizedBox(height: 16),
          _buildFormDateField(
            'Date de naissance (jj/mm/aaaa)',
            widget.birthDateController,
            _fieldErrors['birthDate']!,
            'Veuillez saisir une date valide (jj/mm/aaaa)',
          ),
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

  Widget _buildGenderOption(String label, String value) {
    final isSelected = widget.selectedGender == value;
    final hasError = _fieldErrors['gender']!;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onGenderChanged(value);
          if (hasError) {
            setState(() {
              _fieldErrors['gender'] = false;
            });
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.lightBlueBackground : Colors.white,
            border: Border.all(
              color: hasError
                  ? Colors.red
                  : (isSelected
                      ? AppColors.primaryBlue
                      : AppColors.borderMedium),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: hasError
                        ? Colors.red
                        : (isSelected
                            ? AppColors.primaryBlue
                            : AppColors.borderMedium),
                    width: 1.5,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                hasError ? Colors.red : AppColors.primaryBlue,
                          ),
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller,
      bool hasError, String errorMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: hasError ? Colors.red : AppColors.borderMedium,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: hasError ? Colors.red : AppColors.primaryBlue,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: hasError ? Colors.red : AppColors.borderMedium,
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
            if (hasError) {
              setState(() {
                if (label.contains('Prénom')) {
                  _fieldErrors['firstName'] = false;
                } else if (label.contains('Nom')) {
                  _fieldErrors['lastName'] = false;
                } else if (label.contains('Date')) {
                  _fieldErrors['birthDate'] = false;
                }
              });
            }
          },
        ),
        if (hasError) ...[
          const SizedBox(height: 8),
          Text(
            errorMessage,
            style: GoogleFonts.poppins(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildFormDateField(String label, TextEditingController controller,
      bool hasError, String errorMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            DateInputFormatter(), // <-- Ici tu appelles ton formatter
          ],
          maxLength: 10,
          decoration: InputDecoration(
            counterText: '', // ne pas afficher le compteur de caractères
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: hasError ? Colors.red : AppColors.borderMedium,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: hasError ? Colors.red : AppColors.primaryBlue,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: hasError ? Colors.red : AppColors.borderMedium,
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
            if (hasError) {
              setState(() {
                _fieldErrors['birthDate'] = false;
              });
            }
          },
        ),
        if (hasError) ...[
          const SizedBox(height: 8),
          Text(
            errorMessage,
            style: GoogleFonts.poppins(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
        ],
      ],
    );
  }
}
