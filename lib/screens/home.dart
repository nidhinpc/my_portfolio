import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; // For animations
import 'package:animated_text_kit/animated_text_kit.dart'; // For animated text
import 'package:my_portfolio/widgets/animated_text.dart' as custom;
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width < 768; // Define breakpoint for mobile

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: NavBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildContent(),
                )
              : Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: _buildProfileImage(),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildTextContent(),
                          ),
                        ),
                      ],
                    ),
                    const Footer(),
                  ],
                ),
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      _buildProfileImage(),
      const SizedBox(height: 20),
      ..._buildTextContent(),
    ];
  }

  Widget _buildProfileImage() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          'assets/images/profile.jpg',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      )
          .animate()
          .fadeIn(duration: 500.ms)
          .scale(delay: 300.ms)
          .then(delay: 300.ms),
    );
  }

  List<Widget> _buildTextContent() {
    return [
      custom.AnimatedText(
        text: 'Nidhin PC',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
      )
          .animate()
          .fadeIn(duration: 500.ms)
          .slideY(begin: -0.5, end: 0)
          .then(delay: 300.ms),
      const SizedBox(height: 20),
      AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText(
            'Flutter Developer',
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
            speed: const Duration(milliseconds: 50),
          ),
        ],
        isRepeatingAnimation: true,
        totalRepeatCount: 3,
      ),
      const SizedBox(height: 40),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        child: const Text('Get in Touch'),
      ).animate().scale(delay: 1000.ms).then(delay: 300.ms),
      const SizedBox(height: 40),
    ];
  }
}
