import 'package:flutter/material.dart';
import 'package:mobdevs_website/utils/constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sectionPadding, vertical: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Text(
            'MobDevs',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              letterSpacing: 1.2,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNavItem(context, 'Home', '/'),
                _buildNavItem(context, 'Services', '/services'),
                _buildNavItem(context, 'Contact', '/contact'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String text, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 245, 250, 255),
          ),
        ),
      ),
    );
  }
}
