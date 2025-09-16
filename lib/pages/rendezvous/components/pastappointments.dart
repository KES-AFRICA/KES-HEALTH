
  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/custom_toast.dart';
import 'package:kes_health/core/components/roundedbouton.dart';
import 'package:kes_health/core/constants/colors.dart';

Widget buildPastAppointments(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // Message pour les rendez-vous passés
          Center(
            child: Column(
              children: [
                 SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                // SVG ou image pour illustration
                Icon(
                  Icons.history,
                  size: 64,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 16),
                Text(
                  'Aucun RDV passé',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Vous n\'avez pas encore eu de rendez-vous. Prenez rendez-vous avec un professionnel de santé pour commencer votre suivi.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
