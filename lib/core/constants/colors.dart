import 'package:flutter/material.dart';

/// Classe contenant toutes les couleurs de l'application
/// Utilisation: AppColors.primaryBlue, AppColors.secondaryBlue, etc.
class AppColors {
  // Empêche l'instanciation de cette classe
  AppColors._();

  // === COULEURS PRINCIPALES ===
  static const Color primaryBlue = Color(0xFF0F7ACC);
  static const Color secondaryBlue = Color(0xFF00C2FF);
  static const Color lightBlue = Color(0xFF05C7F2);
  static const Color darkBlue = Color(0xFF023059);
  static const Color accentBlue = Color(0xFF117DBF);

  // === COULEURS DE FOND ===
  static const Color lightBlueBackground = Color(0xFFE7F4FC);
  static const Color greyBackground = Color(0xFFF2F2F2);
  static const Color blueGreyBackground = Color(0xFFDCEEF2);
  static const Color ultraLightBlueBackground = Color(0xFFE6F9FF);

  // === COULEURS D'ACCENT ===
  static const Color errorRed = Color(0xFFE7034E);
  static const Color warningYellow = Color(0xFFF2B84B);
  static const Color successGreen = Color(0xFF28A745);

  // === COULEURS UTILITAIRES ===
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // === PALETTE DE BLEUS (pour différentes nuances) ===
  static const Map<int, Color> bluePalette = {
    50: ultraLightBlueBackground,
    100: lightBlueBackground,
    200: blueGreyBackground,
    300: lightBlue,
    400: secondaryBlue,
    500: primaryBlue,
    600: accentBlue,
    700: darkBlue,
    800: Color(0xFF012040),
    900: Color(0xFF001829),
  };

  // === COULEURS POUR LES ÉTATS ===
  static const Color success = Color(0xFF05C7F2);
  static const Color error = errorRed;
  static const Color warning = warningYellow;
  static const Color info = secondaryBlue;

  // === COULEURS POUR LE TEXTE ===
  static const Color textPrimary = darkBlue;
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textOnPrimary = white;
  static const Color textOnDark = white;

  // === COULEURS POUR LES BORDURES ===
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderMedium = Color(0xFFD1D5DB);
  static const Color borderDark = darkBlue;

  // === COULEURS POUR LES OMBRES ===
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowDark = Color(0x4D000000);

  // === MÉTHODES UTILITAIRES ===
  
  /// Retourne une couleur avec une opacité spécifiée
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  /// Retourne une version plus claire de la couleur
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Retourne une version plus foncée de la couleur
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}

/// Extension pour faciliter l'utilisation des couleurs
extension AppColorsExtension on Color {
  /// Retourne la couleur avec une opacité spécifiée
  Color opacity(double opacity) => withOpacity(opacity);
  
  /// Retourne une version plus claire de la couleur
  Color lighter([double amount = 0.1]) => AppColors.lighten(this, amount);
  
  /// Retourne une version plus foncée de la couleur
  Color darker([double amount = 0.1]) => AppColors.darken(this, amount);
}