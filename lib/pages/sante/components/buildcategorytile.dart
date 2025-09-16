import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/constants/colors.dart';

Widget buildCategoryTile({
  required String svgPath, // <-- chemin du SVG
  Color? iconColor,        // <-- optionnel
  required String title,
  required VoidCallback onTap,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    child: ListTile(
      leading: CircleAvatar(
        radius: 32,
        backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
        child: Transform.translate(
          offset: const Offset(0, -7), // décale l’icône vers le bas
          child: SvgPicture.asset(
            svgPath,
            height: 44,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor, BlendMode.srcIn)
                : null, // <-- pas de filtre si aucune couleur
          ),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
