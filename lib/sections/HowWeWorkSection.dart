import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class HowWeWorkSection extends StatelessWidget {
  const HowWeWorkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: isMobile ? 20 : 60), // Reduced vertical padding, increased horizontal on larger screens
      color: const Color(0xFF1A1D2A), // Dark background color
      child: Center( // Center the content horizontally on all screen sizes
        child: ConstrainedBox( // Limit the maximum width of the content for better readability on larger screens
          constraints: const BoxConstraints(maxWidth: 1200), // Adjust the maximum width as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInUp(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Our Process',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                child: Text(
                  'How We Work',
                  style: TextStyle(
                    fontSize: isMobile ? 32 : 48, // Increased font size for better impact
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16), // Slightly reduced spacing
              FadeInUp(
                child: Text(
                  'Our proven development process ensures high-quality mobile applications delivered on time and within budget.',
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 20, // Increased font size for readability
                    color: Colors.white.withOpacity(0.8), // Slightly increased opacity for better visibility
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40), // Slightly reduced spacing
              Wrap(
                alignment: WrapAlignment.center,
                spacing: isMobile ? 24 : 60, // Increased spacing on larger screens
                runSpacing: 32,
                children: [
                  FadeInLeft(
                      child: ProcessStep(
                          number: '1',
                          title: 'Discovery',
                          description:
                              'We analyze your requirements, target audience, and business goals to create a detailed project plan.')),
                  FadeInUp(
                      child: ProcessStep(
                          number: '2',
                          title: 'Design',
                          description:
                              'Our designers create intuitive user interfaces and engaging user experiences tailored to your brand.')),
                  FadeInDown(
                      child: ProcessStep(
                          number: '3',
                          title: 'Development',
                          description:
                              'Our expert developers build your application using the latest technologies and best practices.')),
                  FadeInRight(
                      child: ProcessStep(
                          number: '4',
                          title: 'Launch & Support',
                          description:
                              'We handle the app store submission process and provide ongoing maintenance and support.')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProcessStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const ProcessStep({
    Key? key,
    required this.number,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Adaptive Width for the Steps based on available space
        double width = isMobile
            ? screenWidth * 0.8
            : (constraints.maxWidth > 600 ? 280 : 240); // Increased width on larger screens

        return SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70, //Increased Number container Size
                height: 70, //Increased Number container Size
                decoration: const BoxDecoration(
                  color: Color(0xFF343A40), // Darker background color for the number
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(
                      fontSize: 28, //Increased Number Size
                      fontWeight: FontWeight.bold,
                      color: Colors.white, //Change here
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12), // Reduced spacing
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 18 : 22, // Increased font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 18, // Increased font size
                  color: Colors.white.withOpacity(0.7),
                  height: 1.4, // Improved line height for better readability
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}