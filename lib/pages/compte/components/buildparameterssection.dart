  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/pages/compte/components/buildsettingslisttile.dart';

Widget buildParametersSection(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Paramètres',
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
          icon: Icons.public,
          title: 'Pays',
          subtitle: 'Pays où vous avez besoin de soins',
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 24,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    'assets/images/png/flag_cameroon.png', // Assurez-vous d'avoir ce fichier
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.blue,
                        child: const Center(
                          child: Text('flag cameroon', style: TextStyle(fontSize: 10)),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
          onTap: () {
            // Navigation vers sélection pays
          },
        ),
        buildSettingsListTile(
          context: context,
          screenWidth: screenWidth,
          icon: Icons.chat_bubble_outline,
          title: 'Langue',
          subtitle: 'Langue du compte',
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Français',
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
            // Navigation vers sélection langue
          },
        ),
      ],
    );
  }

