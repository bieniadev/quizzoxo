import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'This is an educational application. It uses things like connecting to Firebase, state management with provider, google/apple authentication.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
