import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? altIcon;
  final bool isActive;
  CircularButton(
      {required this.backgroundColor,
      required this.icon,
      this.onTap,
      this.altIcon,
      this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: isActive ? backgroundColor : Colors.grey,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: altIcon ??
              Icon(
                icon,
                color: Colors.white,
                size: 18,
              ),
        ),
      ),
    );
  }
}
