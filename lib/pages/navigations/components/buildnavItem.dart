  import 'package:flutter/material.dart';
import 'package:kes_health/core/constants/colors.dart';

Widget buildNavItem(IconData icon, String label, int index, int selectedIndex) {
    final bool isActive = selectedIndex == index;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // La barre avec animation fluide
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 3,
          width: isActive ? 25 : 0,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 4),
        // Icône avec couleur animée
        Icon(
          icon,
          color: isActive ? AppColors.primaryBlue : AppColors.darkBlue,
        ),
        // Texte avec animation de style
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: isActive ? AppColors.primaryBlue : AppColors.darkBlue,
            fontSize: 12,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          ),
          child: Text(label),
        ),
      ],
    );
  }
