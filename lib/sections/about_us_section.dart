import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class AboutUsSection extends StatefulWidget {
  const AboutUsSection({Key? key}) : super(key: key);

  @override
  State<AboutUsSection> createState() => _AboutUsSectionState();
}

class _AboutUsSectionState extends State<AboutUsSection> {
  bool _isMeetOurTeamHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: isMobile ? 20 : 60), // Adjusted padding
      color: const Color(0xFF242939), // Dark background color
      child: Center(  // Centering the whole section
        child: ConstrainedBox( // Limiting the width
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Flex(  // Using Flex widget for responsive layout
            direction: isMobile ? Axis.vertical : Axis.horizontal, // Vertical on mobile, horizontal on larger screens
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1, // No flex on mobile, takes natural height
                child: Padding(
                  padding: EdgeInsets.only(bottom: isMobile ? 32 : 0), // Add padding on mobile
                  child: FadeInLeft(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About Us',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Who We Are',
                          style: TextStyle(
                            fontSize: 40, //Adjusted Font Size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'MobDevs is a team of passionate mobile developers dedicated to creating exceptional mobile experiences. Founded in 2020, we\'ve helped dozens of businesses transform their digital presence.\n\nOur mission is to deliver high-quality, user-centric mobile applications that drive business growth and provide seamless user experiences.',
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 18, // Responsive font size
                            color: Colors.white.withOpacity(0.7),
                            height: 1.4,  // Improved line height
                          ),
                        ),
                        const SizedBox(height: 32),
                        Wrap( // Using Wrap for responsive stat layout
                          alignment: WrapAlignment.start,
                          spacing: 24, // Spacing between stats
                          runSpacing: 16, // Spacing between rows
                          children: [
                            _buildStat('50+', 'Projects Completed'),
                            _buildStat('100+', 'Happy Clients'),
                            _buildStat('15+', 'Team Members'),
                            _buildStat('5+', 'Years Experience'),
                          ],
                        ),
                        const SizedBox(height: 32),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) => setState(() => _isMeetOurTeamHovered = true),
                          onExit: (_) => setState(() => _isMeetOurTeamHovered = false),
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // Handle "Meet Our Team" action
                            },
                            icon: const Icon(Icons.groups, color: Colors.white, size: 20),
                            label: const Text('Meet Our Team', style: TextStyle(color: Colors.white)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white.withOpacity(0.5)),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                              textStyle: const TextStyle(fontSize: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              backgroundColor: _isMeetOurTeamHovered ? Colors.white.withOpacity(0.1) : Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: isMobile ? 0 : 32), // Remove SizedBox on mobile
              Expanded(
                flex: isMobile ? 0 : 1, // No flex on mobile, takes natural height
                child: FadeInRight(
                  child: Container(
                    width: isMobile ? double.infinity : 400,  //Full width on Mobile
                    height: isMobile ? 300 : 400, //Adjust height on Mobile,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1), // Placeholder background
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,  //Adjusted size
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}