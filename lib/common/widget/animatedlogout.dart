import 'package:flutter/material.dart';

class TAnimatedLogoutButton extends StatefulWidget {
  final VoidCallback onPressed;

  const TAnimatedLogoutButton({super.key, required this.onPressed});

  @override
  _TAnimatedLogoutButtonState createState() => _TAnimatedLogoutButtonState();
}

class _TAnimatedLogoutButtonState extends State<TAnimatedLogoutButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: _isPressed
              ? LinearGradient(colors: [Colors.red.shade700, Colors.red.shade900])
              : LinearGradient(colors: [Colors.red.shade500, Colors.red.shade700]),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              blurRadius: _isPressed ? 4 : 10,
              spreadRadius: _isPressed ? 1 : 3,
              offset: Offset(0, _isPressed ? 2 : 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout, color: Colors.white, size: 24),
            const SizedBox(width: 10),
            Text(
              "Logout",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
