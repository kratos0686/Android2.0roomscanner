import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        controller = CameraController(
          cameras![0],
          ResolutionPreset.high,
        );
        await controller!.initialize();
        if (mounted) {
          setState(() {
            isInitialized = true;
          });
        }
      }
    } catch (e) {
      // Camera not available
      debugPrint('Camera initialization error: $e');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Room'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: isInitialized && controller != null
          ? CameraPreview(controller!)
          : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'Camera not available',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This feature requires camera permissions',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
      floatingActionButton: isInitialized
          ? FloatingActionButton(
              onPressed: () {
                // TODO: Implement scan capture
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Scan capture not yet implemented')),
                );
              },
              child: const Icon(Icons.camera),
            )
          : null,
    );
  }
}
