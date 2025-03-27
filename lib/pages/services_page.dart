import 'package:flutter/material.dart';
import 'package:mobdevs_website/sections/services_section.dart';
import 'package:mobdevs_website/widgets/nav.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the default AppBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(), // Add NavBar
            ServicesSection(), // Reuse your ServicesSection
            // Add more content specific to the Services page if needed
          ],
        ),
      ),
    );
  }
}