import 'package:flutter/material.dart';
import 'package:my_portfolio/models/experience.dart';
import 'package:my_portfolio/widgets/experience_card.dart';

class AboutScreen extends StatelessWidget {
  final List<Experience> experiences = [
    Experience(
      company: 'Rootments Enterprises LLP',
      role: 'Flutter Developer Intern',
      duration: 'Dec 2024 - Present',
      description: 'Building an innovative wedding rental app.',
    ),
    Experience(
      company: 'Luminar Technolab',
      role: 'Flutter Developer Trainee',
      duration: 'June 2024 - Nov 2024',
      description: 'Developed mobile apps using Flutter.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Me')),
      body: ListView.builder(
        itemCount: experiences.length,
        itemBuilder: (context, index) {
          return ExperienceCard(experience: experiences[index]);
        },
      ),
    );
  }
}
