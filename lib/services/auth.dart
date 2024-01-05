import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sunnah_diet/constants/global.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await currentUser?.reload();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    currentUserId = '';
    currentUserName = '';
  }

  Future<bool> isAdmin() async {
    final email = _auth.currentUser?.email;
    await currentUser?.reload();
    if (email != null) {
      final adminList = await _firestore.collection('admin-list').get();
      final adminEmails =
          adminList.docs.map((doc) => doc.data()['email']).toList();
      return adminEmails.contains(email);
    }
    return false;
  }
}
