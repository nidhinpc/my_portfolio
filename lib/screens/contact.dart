import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants.dart';
import 'package:my_portfolio/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to send an email
  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: AppConstants.email,
      queryParameters: {
        'subject': 'Contact from Portfolio',
        'body': 'Hello Nidhin,',
      },
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }

  // Function to make a phone call
  Future<void> _makePhoneCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: AppConstants.phone);
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch phone call';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Me'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            const SectionTitle(title: 'Get in Touch'),
            const SizedBox(height: 20),

            // Contact Information
            _buildContactInfo(context),
            const SizedBox(height: 30),

            // Social Media Links
            _buildSocialLinks(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const Icon(Icons.email, color: Colors.blue),
          title: const Text('Email'),
          subtitle: Text(AppConstants.email),
          onTap: _sendEmail,
        ),
        ListTile(
          leading: const Icon(Icons.phone, color: Colors.green),
          title: const Text('Phone'),
          subtitle: Text(AppConstants.phone),
          onTap: _makePhoneCall,
        ),
      ],
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Social Media'),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.link, color: Colors.purple),
          title: const Text('GitHub'),
          subtitle: Text(AppConstants.githubUrl),
          onTap: () => _launchURL(AppConstants.githubUrl),
        ),
        ListTile(
          leading: const Icon(Icons.link, color: Colors.blue),
          title: const Text('LinkedIn'),
          subtitle: Text(AppConstants.linkedinUrl),
          onTap: () => _launchURL(AppConstants.linkedinUrl),
        ),
      ],
    );
  }
}
