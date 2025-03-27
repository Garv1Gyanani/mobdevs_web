import 'package:flutter/material.dart';
import 'package:mobdevs_website/sections/HowWeWorkSection.dart';
import 'package:mobdevs_website/sections/TestimonialsSection.dart';
import 'package:mobdevs_website/sections/hero_section.dart';
import 'package:mobdevs_website/sections/services_section.dart';
import 'package:mobdevs_website/sections/about_us_section.dart';
import 'package:mobdevs_website/widgets/footer.dart';
import 'package:mobdevs_website/widgets/nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(), // Add the NavBar at the top
            HeroSection(),
            ServicesSection(),
            HowWeWorkSection(),
            TestimonialsSection(),
            AboutUsSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}