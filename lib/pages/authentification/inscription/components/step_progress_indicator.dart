// components/step_progress_indicator.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressIndicator({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: List.generate(totalSteps * 2 - 1, (index) {
          if (index.isEven) {
            // Cercle
            final stepNumber = index ~/ 2 + 1;
            final isCompleted = stepNumber <= currentStep;
            final isActive = stepNumber == currentStep;

            return Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? AppColors.primaryBlue : Colors.grey.shade300,
                border: isActive
                    ? Border.all(color: AppColors.primaryBlue, width: 2)
                    : null,
              ),
              child: Center(
                child: Text(
                  stepNumber.toString(),
                  style: GoogleFonts.poppins(
                    color: isCompleted ? Colors.white : Colors.grey.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          } else {
            // Ligne de connexion
            final lineIndex = index ~/ 2;
            final isCompleted = lineIndex + 1 < currentStep;

            return Expanded(
              child: Container(
                height: 2,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: isCompleted ? AppColors.primaryBlue : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
