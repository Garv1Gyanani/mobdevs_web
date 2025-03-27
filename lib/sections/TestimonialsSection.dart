import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({Key? key}) : super(key: key);

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: isMobile ? 20 : 60), // Adjusted padding
      color: const Color(0xFF1A1D2A), // Dark background color
      child: Center( // Center the content horizontally
        child: ConstrainedBox( // Limit the maximum width for readability
          constraints: const BoxConstraints(maxWidth: 1200), // Adjust max width as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center the heading and description
            children: [
              FadeInUp(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Testimonials',
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
                  'What Our Clients Say',
                  style: TextStyle(
                    fontSize: isMobile ? 32 : 48, // Increased font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center, // Center the heading
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                child: Text(
                  "Don't just take our word for it. Here's what our clients have to say about our mobile development services.",
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 20, // Increased font size
                    color: Colors.white.withOpacity(0.8), // Increased opacity
                  ),
                  textAlign: TextAlign.center, // Center the description
                ),
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(  // Added ScrollView for responsiveness
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the testimonials
                  children:  [
                    FadeInLeft(child: TestimonialCard(
                      name: 'John Doe',
                      title: 'CEO, TechCorp',
                      testimonial:
                      'MobDevs delivered an exceptional iOS app that exceeded our expectations. Their attention to detail and commitment to quality is unmatched.',
                    )),
                    const SizedBox(width: 24),
                    FadeInUp(child: TestimonialCard(
                      name: 'Jane Smith',
                      title: 'Founder, FitLife',
                      testimonial:
                      'Working with MobDevs on our fitness app was a game-changer. They understood our vision and delivered a product our users love.',
                    )),
                    const SizedBox(width: 24),
                    FadeInRight(child: TestimonialCard(
                      name: 'Robert Johnson',
                      title: 'CTO, DeliverEats',
                      testimonial:
                      'The Android app MobDevs built for our food delivery service has significantly improved our customer engagement and sales.',
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              FadeInUp(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle "Read More Testimonials" action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF242939), // Slightly lighter than background
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Read More Testimonials'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 18),
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

class TestimonialCard extends StatelessWidget {
  final String name;
  final String title;
  final String testimonial;

  const TestimonialCard({
    Key? key,
    required this.name,
    required this.title,
    required this.testimonial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return SizedBox(  // Changed Container to SizedBox
      width: isMobile ? screenWidth * 0.8 : 400, //Increased Card Size
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF242939), // Slightly lighter than background
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white10,
                  radius: 24,
                  child: Icon(Icons.person, color: Colors.white, size: 32),
                ),
                const SizedBox(width: 16),
                Expanded( // Take available space
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        overflow: TextOverflow.ellipsis, // Handle long titles
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              testimonial,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: Colors.white.withOpacity(0.8),
                height: 1.4, // Improved line height for readability
              ),
            ),
          ],
        ),
      ),
    );
  }
}