import 'package:flutter/material.dart';
import '../widgets/scan_button.dart';
import '../services/firebase_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final firebaseService = Provider.of<FirebaseService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Scanner'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.view_in_ar,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Room Scanner',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Scan and create 3D models of your rooms',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const ScanButton(),
            const SizedBox(height: 20),
            FutureBuilder<bool>(
              future: firebaseService.isConnected(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data == true) {
                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_done, color: Colors.green, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Firebase Connected',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  );
                }
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_off, color: Colors.orange, size: 16),
                    SizedBox(width: 8),
                    Text(
                      'Firebase Not Configured',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
