// import 'dart:math';
// import 'package:flutter/material.dart';
// import '../../../res/constants.dart';
// import '../../../view model/responsive.dart';

// class AnimatedImageContainer extends StatefulWidget {
//   const AnimatedImageContainer({Key? key, this.height = 300, this.width = 250})
//       : super(key: key);

//   final double width;
//   final double height;

//   @override
//   AnimatedImageContainerState createState() => AnimatedImageContainerState();
// }

// class AnimatedImageContainerState extends State<AnimatedImageContainer>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     )..repeat(reverse: true);

//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         double bounceOffset = 5 * sin(_controller.value * pi); // Smooth bounce effect

//         return Transform.translate(
//           offset: Offset(0, bounceOffset),
//           child: Container(
//             height: widget.height,
//             width: widget.width,
//             padding: const EdgeInsets.all(defaultPadding / 4),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               gradient: const LinearGradient(
//                 colors: [Colors.pinkAccent, Colors.blue],
//               ),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.pink,
//                   offset: Offset(-2, 0),
//                   blurRadius: 20,
//                 ),
//                 BoxShadow(
//                   color: Colors.blue,
//                   offset: Offset(2, 0),
//                   blurRadius: 20,
//                 ),
//               ],
//             ),
//             child: Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Image.asset(
//                 'assets/images/image.png',
//                 height: _getResponsiveSize(context),
//                 width: _getResponsiveSize(context),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   double _getResponsiveSize(BuildContext context) {
//     double screenWidth = MediaQuery.sizeOf(context).width;
//     if (Responsive.isLargeMobile(context)) {
//       return screenWidth * 0.2;
//     } else if (Responsive.isTablet(context)) {
//       return screenWidth * 0.14;
//     }
//     return 200; // Default size
//   }
// }
