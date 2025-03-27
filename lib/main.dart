import 'package:flutter/material.dart';
import 'package:mobdevs_website/pages/home_page.dart';
import 'package:mobdevs_website/pages/contact_page.dart';
import 'package:mobdevs_website/pages/services_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobDevs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/contact': (context) => const ContactPage(),
        '/services': (context) => const ServicesPage(),
      },
    );
  }
}