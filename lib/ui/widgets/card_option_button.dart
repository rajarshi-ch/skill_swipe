import 'package:flutter/material.dart';

class CardOptionButton extends StatelessWidget {
  const CardOptionButton(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.title});
  final IconData icon;
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 37,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 8),
      decoration: ShapeDecoration(
        color: Color(0xFFF7F8F9),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFDADADA)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 18,
          ),
          Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF242323),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
