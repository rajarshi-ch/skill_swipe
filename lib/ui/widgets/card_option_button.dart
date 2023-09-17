import 'package:flutter/material.dart';

class CardOptionButton extends StatelessWidget {
  const CardOptionButton(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.title,
      this.color});
  final IconData icon;
  final VoidCallback onTap;
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 37,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: Color(0xFFF7F8F9),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFDADADA)),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color ?? Colors.grey,
              size: 18,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                color: color ?? Color(0xFF242323),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
