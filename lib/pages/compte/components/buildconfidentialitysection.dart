  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/pages/compte/components/buildsettingslisttile.dart';

Widget buildConfidentialitySection(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confidentialité',
          style: GoogleFonts.poppins(
            color: AppColors.darkBlue,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: screenWidth * 0.03),
        buildSettingsListTile(
          context: context,
          screenWidth: screenWidth,
          icon: Icons.person_outline,
          title: 'Mes préférences',
          subtitle: null,
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {
            // Navigation vers préférences
          },
        ),
        buildSettingsListTile(
          context: context,
          screenWidth: screenWidth,
          icon: Icons.description_outlined,
          title: 'Informations légales',
          subtitle: null,
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {
            // Navigation vers informations légales
          },
        ),
      ],
    );
  }
