  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/custom_toast.dart';
import 'package:kes_health/core/components/roundedbouton.dart';
import 'package:kes_health/core/constants/colors.dart';

Widget buildUpcomingAppointments(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ici vous pouvez ajouter la liste des rendez-vous à venir
          Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                // SVG ou image pour "Aucun rendez-vous"
                Icon(
                  Icons.calendar_today,
                  size: 64,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 16),
                Text(
                  'Aucun rendez-vous à venir',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Vous n\'avez pas de rendez-vous programmé pour le moment. Prenez rendez-vous avec un professionnel de santé pour commencer votre suivi.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),
                RoundedButton(
                  text: 'PRENDRE RENDEZ-VOUS',
                  onPressed: () {
                    CustomToast.warning(
                    context: context,
                    title: 'Non disponible',
                    description: 'Fonctionnalité en cours de développement.',
                  );
                  },
                  color: AppColors.primaryBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
