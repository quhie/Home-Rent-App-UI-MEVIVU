import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomButton({required this.text, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(13.0),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFF0A8ED9),
                Color(0xFFA0DAFB).withOpacity(0.14),
              ],
            )
                : const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFFF7F7F7),
                Color(0xFFF7F7F7),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: FittedBox(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Raleway',
                color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF858585),
              ),
            ),
          ),
        ),
      ),
    );
  }
}