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
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: NavBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                children: [
                  // Your Photo with Animation
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100), // Circular photo
                    child: Image.asset(
                      'assets/images/profile.jpg', // Path to your photo
                      width: 150, // Adjust the size
                      height: 150,
                      fit: BoxFit.cover, // Ensure the photo fits
                    ),
                  )
                      .animate() // Start animation
                      .fadeIn(duration: 500.ms) // Fade in animation
                      .scale(delay: 300.ms) // Scale animation
                      .then(delay: 300.ms), // Delay before next animation

                  const SizedBox(height: 20),

                  // Animated Text with flutter_animate
                  custom.AnimatedText(
                    text: 'Nidhin PC',
                    style: Theme.of(context).textTheme.headlineMedium!,
                  )
                      .animate() // Start animation
                      .fadeIn(duration: 500.ms) // Fade in animation
                      .slideY(begin: -0.5, end: 0) // Slide from top
                      .then(delay: 300.ms), // Delay before next animation

                  const SizedBox(height: 20),

                  // Animated Text with animated_text_kit
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Flutter Developer | UI/UX Enthusiast',
                        textStyle: Theme.of(context).textTheme.bodyLarge!,
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    isRepeatingAnimation: true, // Loop the animation
                    totalRepeatCount: 3, // Repeat 3 times
                  ),

                  const SizedBox(height: 40),

                  // Animated Button
                  ElevatedButton(
                    onPressed: () {
                      // Add your action here
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Get in Touch'),
                  )
                      .animate() // Start animation
                      .scale(delay: 1000.ms) // Scale animation
                      .then(delay: 300.ms), // Delay before next animation
                ],
              ),
            ),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
