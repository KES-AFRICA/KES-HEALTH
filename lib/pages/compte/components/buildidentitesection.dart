  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/pages/compte/components/buildsettingslisttile.dart';

Widget buildIdentiteSection(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Identité',
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
          title: 'Mon profil',
          subtitle: 'Nague Justin',
          trailing: 
              const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {
            // Navigation vers sélection profil
          },
        ),
        buildSettingsListTile(
          context: context,
          screenWidth: screenWidth,
          icon: Icons.group_outlined,  
          title: 'Ma famille',
          subtitle: 'Ajouter et gérer les profils des membres de votre famille',
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '',
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade600,
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
          onTap: () {
            // Navigation vers sélection famille
          },
        ),
      ],
    );
  }

