import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:device_frame/device_frame.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: isMobile ? 20 : 60),
      color: const Color(0xFF242939),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                child: const Text('Services',
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ),
              const SizedBox(height: 8),
              FadeInUp(
                child: const Text('What We Offer',
                    style: TextStyle(
                        fontSize: 40, // Adjusted Font Size
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                child: Text(
                  'Our comprehensive mobile development services to help your business succeed in the digital world.',
                  style: TextStyle(
                      fontSize: isMobile ? 16 : 18, //Responsive Font Size
                      color: Colors.white.withOpacity(0.7),
                      height: 1.4), //Improved line height
                ),
              ),
              const SizedBox(height: 32),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.blueAccent, //Theme Color
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                indicatorWeight: 3.0,
                tabs: const [
                  Tab(text: 'iOS Development'),
                  Tab(text: 'Android Development'),
                  Tab(text: 'Cross-Platform'),
                ],
              ),
              FadeIn(
                child: SizedBox(
                  height: isMobile ? 800 : 500, //Adjusted Height for Mobile
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      ServiceDetails(
                        title: 'iOS Development',
                        description: 'Crafting exceptional iOS experiences...',
                        features: [
                          'Native iOS performance',
                          'Optimized for Apple devices',
                          'Seamless integration with iOS ecosystem',
                        ],
                        platform: PlatformType.ios,
                      ),
                      ServiceDetails(
                        title: 'Android Development',
                        description: 'Building powerful Android applications...',
                        features: [
                          'Native Android performance',
                          'Optimized for Google Play Store',
                          'Wide device compatibility',
                        ],
                        platform: PlatformType.android,
                      ),
                      ServiceDetails(
                        title: 'Cross-Platform Solutions',
                        description:
                            'Building efficient multi-platform applications using React Native and Flutter...',
                        features: [
                          'React Native & Flutter development',
                          'Single codebase for multiple platforms',
                          'Native-like performance',
                          'Faster development cycles',
                          'Cost-effective solutions',
                        ],
                        platform: PlatformType.crossPlatform,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum PlatformType { ios, android, crossPlatform }

class ServiceDetails extends StatelessWidget {
  final String title;
  final String description;
  final List<String> features;
  final PlatformType platform;

  const ServiceDetails({
    Key? key,
    required this.title,
    required this.description,
    required this.features,
    required this.platform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 28, // Adjusted Font Size
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 16),
                Text(description,
                    style: TextStyle(
                        fontSize: isMobile ? 16 : 18, //Responsive Font Size
                        color: Colors.white.withOpacity(0.7),
                        height: 1.4)), //Improved line height
                const SizedBox(height: 24),
                for (String feature in features)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle,
                            color: Colors.green, size: 20),
                        const SizedBox(width: 8),
                        Text(feature,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Learn More'),
                ),
              ],
            ),
          ),
          SizedBox(width: isMobile ? 0 : 32), // Remove SizedBox on mobile
          Expanded(
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  if (platform == PlatformType.ios ||
                      platform == PlatformType.crossPlatform)
                    const DeviceFrameWrapper(platform: PlatformType.ios),
                  if (platform == PlatformType.android ||
                      platform == PlatformType.crossPlatform)
                    const DeviceFrameWrapper(platform: PlatformType.android),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceFrameWrapper extends StatelessWidget {
  final PlatformType platform;

  const DeviceFrameWrapper({Key? key, required this.platform})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    DeviceInfo device;
    switch (platform) {
      case PlatformType.ios:
        device = Devices.ios.iPhone13;
        break;
      case PlatformType.android:
        device = Devices.android.onePlus8Pro;
        break;
      default: //Shouldn't happen, but good to have a default
        device = Devices.ios.iPhone13;
        break;
    }

    return SizedBox(
      width: isMobile ? 150 : 200, //Reduced Size for mobile
      height: isMobile ? 300 : 400, //Reduced Size for mobile
      child: DeviceFrame(
        device: device,
        screen: Container(
          color: Colors.grey.shade800,
          child: Center(
            child: Icon(
              platform == PlatformType.ios
                  ? Icons.phone_iphone
                  : Icons.phone_android,
              size: isMobile ? 40 : 80, //Reduced Icon Size for mobile
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}