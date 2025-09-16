import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedBadge extends StatefulWidget {
  final String text;
  final Color textColor;
  final VoidCallback? onPressed;

  const AnimatedBadge({
    super.key,
    required this.text,
    required this.textColor,
    this.onPressed,
  });

  @override
  State<AnimatedBadge> createState() => _AnimatedBadgeState();
}

class _AnimatedBadgeState extends State<AnimatedBadge> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _isPressed
              ? widget.textColor.withOpacity(0.3)
              : widget.textColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
            color: widget.textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}