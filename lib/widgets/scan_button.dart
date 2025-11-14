import 'package:flutter/material.dart';
import 'scan_screen.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScanScreen()),
        );
      },
      icon: const Icon(Icons.camera_alt),
      label: const Text('Start Scanning'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
