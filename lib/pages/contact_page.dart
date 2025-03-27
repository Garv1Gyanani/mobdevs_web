import 'package:flutter/material.dart';
import 'package:mobdevs_website/utils/constants.dart';
import 'package:mobdevs_website/widgets/custom_button.dart';
import 'package:mobdevs_website/widgets/nav.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.sectionPadding,
                horizontal: screenWidth < 768 ? AppSizes.sectionPadding / 2 : AppSizes.sectionPadding,
              ),
              color: const Color(0xFF242939), // Dark background color
              child: Center(
                child: SizedBox(
                  width: screenWidth < 768 ? double.infinity : 1000, // Adjust width
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact Info Column
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Contact', // Section label
                                style: TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Get In Touch',
                                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Ready to start your mobile project? Contact us today for a free consultation.',
                                style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
                              ),
                              const SizedBox(height: 32),
                              _buildContactInfo(Icons.email, 'Email Us', 'info@mobdevs.com'),
                              _buildContactInfo(Icons.phone, 'Call Us', '+1 (555) 123-4567'),
                              _buildContactInfo(Icons.business, 'Business Hours', 'Monday - Friday: 9AM - 5PM EST'),
                              _buildContactInfo(Icons.support, 'Support', 'support@mobdevs.com'),
                            ],
                          ),
                        ),
                      ),

                      // Form Column
                      Expanded(
                        flex: 2,
                        child: Card(
                          color: const Color(0xFF343A40), // Dark card background
                          elevation: 8,
                          shadowColor: AppColors.primaryColor.withOpacity(0.3),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: _buildTextField(label: 'First name')),
                                      const SizedBox(width: 16),
                                      Expanded(child: _buildTextField(label: 'Last name')),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(label: 'Email', keyboardType: TextInputType.emailAddress),
                                  const SizedBox(height: 16),
                                  _buildTextField(label: 'Subject'),
                                  const SizedBox(height: 16),
                                  _buildTextField(label: 'Message', maxLines: 5),
                                  const SizedBox(height: 32),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      onPressed: _isSubmitting ? null : () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            _isSubmitting = true;
                                          });
                                          Future.delayed(const Duration(seconds: 3), () {
                                            setState(() {
                                              _isSubmitting = false;
                                            });
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Message sent successfully!')),
                                            );
                                            _formKey.currentState!.reset();
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(_isSubmitting ? 'Submitting...' : 'Send Message'),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.arrow_forward), // Arrow icon
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.7), size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                Text(content, style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.7))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      style: const TextStyle(color: Colors.white), // Light text
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, // Remove border
        ),
        filled: true,
        fillColor: const Color(0xFF454D55), // Dark input background
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (label == 'Email' && !value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}
class AppSizes {
  static const double sectionPadding = 32.0;
}class AppColors {
  static const Color primaryColor = Color(0xFFBB86FC);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color foregroundColor = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color whiteColor = Color(0xFF121212); //Background Color
}
