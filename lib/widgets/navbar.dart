import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/about.dart';
import 'package:my_portfolio/screens/contact.dart';
import 'package:my_portfolio/screens/home.dart';
import 'package:my_portfolio/screens/projects.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Nidhin PC'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }));
            },
            child: const Text('Home')),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AboutScreen();
              }));
            },
            child: const Text('About')),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProjectsScreen();
              }));
            },
            child: const Text('Projects')),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ContactScreen();
              }));
            },
            child: const Text('Contact')),
      ],
    );
  }
}
