import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/config/theme/app_colors.dart';

class ThemeRoundButton extends StatelessWidget {
  final String svgAsset;
  final String label;
  final VoidCallback onPressed;

  const ThemeRoundButton({
    super.key,
    required this.svgAsset,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(40),
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFF30393C).withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    svgAsset,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 13, color: AppColors.greyColor),
        ),
      ],
    );
  }
}
