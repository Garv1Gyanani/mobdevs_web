import 'package:flutter/material.dart';
import 'package:mobdevs_website/utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      color: AppColors.secondaryColor,
      child: const Center(
        child: Text(
          '© 2023 MobDevs. All rights reserved.',
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}