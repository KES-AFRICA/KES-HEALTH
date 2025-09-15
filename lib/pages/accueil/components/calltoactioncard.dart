import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/roundedbouton.dart';

enum CardElementType { image, title, subtitle, button }

class CallToActionCard extends StatelessWidget {
  final Color backgroundColor;
  final String? imageUrl;
  final Widget? customImage;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final List<CardElementType> elementOrder;
  final Color? buttonColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CallToActionCard({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onButtonPressed,
    this.imageUrl,
    this.customImage,
    this.elementOrder = const [
      CardElementType.image,
      CardElementType.title,
      CardElementType.subtitle,
      CardElementType.button,
    ],
    this.buttonColor,
    this.titleColor,
    this.subtitleColor,
    this.borderRadius = 8.0,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final defaultPadding = EdgeInsets.all(screenWidth * 0.04);

    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding:
          EdgeInsets.only(top: screenWidth * 0.1, bottom: screenWidth * 0.1),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: padding ?? defaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _buildOrderedElements(context),
        ),
      ),
    );
  }

  List<Widget> _buildOrderedElements(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Map<CardElementType, Widget> elements = {
      CardElementType.image: _buildImage(screenWidth),
      CardElementType.title: _buildTitle(screenWidth),
      CardElementType.subtitle: _buildSubtitle(screenWidth),
      CardElementType.button: _buildButton(context),
    };

    List<Widget> orderedWidgets = [];

    for (int i = 0; i < elementOrder.length; i++) {
      CardElementType elementType = elementOrder[i];
      Widget? element = elements[elementType];

      if (element != null) {
        orderedWidgets.add(element);

        // Ajouter un espacement entre les éléments (sauf pour le dernier)
        if (i < elementOrder.length - 2) {
          orderedWidgets.add(SizedBox(height: screenWidth * 0.03));
        }
        if (i == elementOrder.length - 2) {
          orderedWidgets.add(SizedBox(height: screenWidth * 0.08));
        }
      }
    }

    return orderedWidgets;
  }

  Widget _buildImage(double screenWidth) {
    if (customImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: customImage!,
        ),
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      if (imageUrl!.startsWith('http')) {
        // Image depuis Internet
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl!,
            width: screenWidth * 0.5,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: screenWidth * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.image_not_supported,
                  size: screenWidth * 0.1,
                  color: Colors.grey.shade600,
                ),
              );
            },
          ),
        );
      } else {
        // Image locale (assets)
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imageUrl!,
            width: screenWidth * 0.5,
            fit: BoxFit.contain,
          ),
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildTitle(double screenWidth) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: screenWidth * 0.04,
        fontWeight: FontWeight.w700,
        color: titleColor ?? Colors.black87,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitle(double screenWidth) {
    return Text(
      subtitle,
      style: GoogleFonts.poppins(
        fontSize: screenWidth * 0.035,
        fontWeight: FontWeight.w500,
        color: subtitleColor ?? Colors.black54,
        height: 1.4,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButton(BuildContext context) {
    return RoundedButton(
      text: buttonText,
      color: buttonColor ?? Theme.of(context).primaryColor,
      onPressed: onButtonPressed,
    );
  }
}
