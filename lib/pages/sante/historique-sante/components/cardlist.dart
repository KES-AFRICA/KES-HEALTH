// health_reminder_card.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';

class ReminderCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;
  final VoidCallback onAppointmentPressed;

  const ReminderCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
    required this.onAppointmentPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Texte principal
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Flèche de navigation
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Bouton Prendre rendez-vous
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: onAppointmentPressed,
                  icon: const Icon(Icons.calendar_today),
                  label: Text(
                    'Prendre rendez-vous',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: AppColors.primaryBlue),
                    foregroundColor: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}