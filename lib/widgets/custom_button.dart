// widgets/custom_button.dart
import 'package:flutter/material.dart';
import 'package:mobdevs_website/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle; // Make the buttonStyle optional

  const CustomButton({Key? key, required this.text, required this.onPressed, this.buttonStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle ?? ElevatedButton.styleFrom( // Use the passed style or a default
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: const TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        ),
      ),
      child: Text(text, style: const TextStyle(color: AppColors.whiteColor)),
    );
  }
}