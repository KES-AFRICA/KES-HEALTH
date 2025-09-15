import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  /// Affiche un toast personnalisé
  static void show({
    required BuildContext context,
    required String title,
    String? description,
    ToastificationType type = ToastificationType.info,
    IconData? icon,
    Color? iconColor,
    Color? primaryColor,
    Duration autoCloseDuration = const Duration(seconds: 5),
    Alignment alignment = Alignment.topRight,
  }) {
    // Déterminer les valeurs par défaut selon le type
    final defaultValues = _getDefaultValues(type);
    
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flat,
      autoCloseDuration: autoCloseDuration,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      description: description != null
          ? Text(
              description,
              style: const TextStyle(color: Colors.black54),
            )
          : null,
      alignment: alignment,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(
        icon ?? defaultValues.icon,
        color: iconColor ?? defaultValues.iconColor,
      ),
      primaryColor: primaryColor ?? defaultValues.primaryColor,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      borderRadius: BorderRadius.circular(12),
      showProgressBar: true,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      closeButton: const ToastCloseButton(),
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  /// Retourne les valeurs par défaut selon le type de toast
  static _ToastDefaultValues _getDefaultValues(ToastificationType type) {
    switch (type) {
      case ToastificationType.success:
        return _ToastDefaultValues(
          icon: Icons.check_circle,
          iconColor: Colors.green,
          primaryColor: Colors.green,
        );
      case ToastificationType.error:
        return _ToastDefaultValues(
          icon: Icons.error,
          iconColor: Colors.red,
          primaryColor: Colors.red,
        );
      case ToastificationType.warning:
        return _ToastDefaultValues(
          icon: Icons.warning,
          iconColor: Colors.orange,
          primaryColor: Colors.orange,
        );
      case ToastificationType.info:
        return _ToastDefaultValues(
          icon: Icons.info,
          iconColor: Colors.blue,
          primaryColor: Colors.blue,
        );
      default:
        return _ToastDefaultValues(
          icon: Icons.info,
          iconColor: Colors.blue,
          primaryColor: Colors.blue,
        );
    }
  }

  /// Méthodes rapides pour les types courants
  static void success({
    required BuildContext context,
    required String title,
    String? description,
    IconData? icon,
    Color? iconColor,
    Color? primaryColor,
    Duration autoCloseDuration = const Duration(seconds: 5),
  }) {
    show(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.success,
      icon: icon,
      iconColor: iconColor,
      primaryColor: primaryColor,
      autoCloseDuration: autoCloseDuration,
    );
  }

  static void error({
    required BuildContext context,
    required String title,
    String? description,
    IconData? icon,
    Color? iconColor,
    Color? primaryColor,
    Duration autoCloseDuration = const Duration(seconds: 5),
  }) {
    show(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.error,
      icon: icon,
      iconColor: iconColor,
      primaryColor: primaryColor,
      autoCloseDuration: autoCloseDuration,
    );
  }

  static void warning({
    required BuildContext context,
    required String title,
    String? description,
    IconData? icon,
    Color? iconColor,
    Color? primaryColor,
    Duration autoCloseDuration = const Duration(seconds: 5),
  }) {
    show(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.warning,
      icon: icon,
      iconColor: iconColor,
      primaryColor: primaryColor,
      autoCloseDuration: autoCloseDuration,
    );
  }

  static void info({
    required BuildContext context,
    required String title,
    String? description,
    IconData? icon,
    Color? iconColor,
    Color? primaryColor,
    Duration autoCloseDuration = const Duration(seconds: 5),
  }) {
    show(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.info,
      icon: icon,
      iconColor: iconColor,
      primaryColor: primaryColor,
      autoCloseDuration: autoCloseDuration,
    );
  }
}

/// Classe helper pour les valeurs par défaut
class _ToastDefaultValues {
  final IconData icon;
  final Color iconColor;
  final Color primaryColor;

  _ToastDefaultValues({
    required this.icon,
    required this.iconColor,
    required this.primaryColor,
  });
}