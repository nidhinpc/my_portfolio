import 'package:flutter/material.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/widgets/project_card.dart';
import 'package:my_portfolio/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({super.key});

  // Sample data for projects
  final List<Project> projects = [
    Project(
      title: 'Task Reminder App',
      description:
          'A Flutter application for efficient task management using SQLite and Flutter Local Notifications.',
      githubUrl: 'https://github.com/nidhinpc/task-reminder-app',
      technologies: ['Flutter', 'SQLite', 'Dart', 'RESTful APIs'],
    ),
    // Add more projects here
  ];

  // Function to launch GitHub URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            const SectionTitle(title: 'My Projects'),
            const SizedBox(height: 20),

            // List of Projects
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectCard(
                  project: projects[index],
                  onTap: () => _launchURL(projects[index].githubUrl),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
