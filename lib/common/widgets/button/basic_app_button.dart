import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? height;
  final Color? color;
  const BasicAppButton(
      {super.key, required this.onTap, required this.title, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        minimumSize: Size.fromHeight(height?? 70),
      ),
      child: Text(title,style: TextStyle(color: color ?? Colors.white ),),
    );
  }
}
