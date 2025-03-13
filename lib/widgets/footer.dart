import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('© 2024 Nidhin PC',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(width: 20),
          IconButton(onPressed: () {}, icon: const Icon(Icons.email)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
        ],
      ),
    );
  }
}
