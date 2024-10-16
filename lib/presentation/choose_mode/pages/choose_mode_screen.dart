import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone_flutter/common/widgets/button/rounded_button.dart';
import 'package:spotify_clone_flutter/core/config/assets/app_images.dart';
import 'package:spotify_clone_flutter/presentation/intro/pages/get_started.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/config/assets/app_vestors.dart';
import '../../../core/config/theme/app_colors.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.chooseBG),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                SvgPicture.asset(AppVectors.logo),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.greyColor),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ThemeRoundButton(
                        svgAsset: AppVectors.darkMode,
                        label: "Dark",
                        onPressed: () {}),
                    const SizedBox(
                      width: 40,
                    ),
                    ThemeRoundButton(
                        svgAsset: AppVectors.lightMode,
                        label: "Light",
                        onPressed: () {}),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                BasicAppButton(
                  title: "Continue",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const GetStarted()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
