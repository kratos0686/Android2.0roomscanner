import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Check if Firebase is properly initialized and connected
  Future<bool> isConnected() async {
    try {
      // Try to access Firebase
      await _firestore.collection('test').limit(1).get();
      return true;
    } catch (e) {
      // Firebase not configured or no internet
      return false;
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Sign in anonymously
  Future<UserCredential> signInAnonymously() async {
    return await _auth.signInAnonymously();
  }

  // Save scan data to Firestore
  Future<void> saveScanData(Map<String, dynamic> scanData) async {
    await _firestore.collection('scans').add({
      ...scanData,
      'timestamp': FieldValue.serverTimestamp(),
      'userId': _auth.currentUser?.uid,
    });
  }

  // Upload scan file to Storage
  Future<String> uploadScanFile(String filePath, String fileName) async {
    final ref = _storage.ref().child('scans/${_auth.currentUser?.uid}/$fileName');
    final uploadTask = await ref.putFile(File(filePath) as File);
    return await uploadTask.ref.getDownloadURL();
  }

  // Get user's scans
  Stream<QuerySnapshot> getUserScans() {
    return _firestore
        .collection('scans')
        .where('userId', isEqualTo: _auth.currentUser?.uid)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}

class File {
  final String path;
  File(this.path);
}
