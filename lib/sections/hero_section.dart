import 'package:flutter/material.dart';
import 'package:mobdevs_website/utils/constants.dart';
import 'package:mobdevs_website/widgets/custom_button.dart';
import 'package:animate_do/animate_do.dart';
import 'package:device_frame/device_frame.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  int _currentIndex = 0;

  final List<String> appScreens = [
    'assets/images/app_ui_1.png',
    'assets/images/app_ui_2.png',
    'assets/images/app_ui_3.png',
    'assets/images/app_ui_4.png',
  ];

  final List<String> desktopScreens = [
    'assets/images/desktop_ui_1.png',
    'assets/images/desktop_ui_2.png',
  ];


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF121826), Color(0xFF1F2533)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FadeInLeft(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile & Web Development Excellence',
                        style: TextStyle(
                          fontSize: isMobile ? 36 : 52,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'We build exceptional mobile and web experiences that transform businesses and delight users.',
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          color: Colors.white.withOpacity(0.8),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          CustomButton(
                            text: 'Get Started',
                            onPressed: () {
                              Navigator.pushNamed(context, '/contact');
                            },
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white.withOpacity(0.6)),
                              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text('Learn More', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeInRight(
                      child: SizedBox(
                        height: 480,
                        width: 270,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            DeviceFrame(
                              device: Devices.ios.iPhone12ProMax,
                              
                              screen: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: 1000, // Match DeviceFrame height
                                    
                                    viewportFraction: 1.0,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    },
                                  ),
                                  items: appScreens.map((item) => Container(
                                    width: 1000, // Match DeviceFrame width
                                    child: FittedBox(
                                      fit: BoxFit.fill,  // Or BoxFit.cover
                                      child: Image.asset(item),
                                    ),
                                  )).toList(),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  appScreens.length,
                                  (index) => buildDot(index),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    FadeInRight(
                      child: SizedBox(
                        height: 200,
                        child: DeviceFrame(
                          device: Devices.macOS.macBookPro,
                          screen: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              desktopScreens[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: _currentIndex == index ? 14 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(3),
        boxShadow: _currentIndex == index
            ? [BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 5)]
            : [],
      ),
    );
  }
}