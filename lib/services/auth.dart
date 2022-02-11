import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //stream current user
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      // do nothing
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> googleLogin() async {
    try {
      await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
    } on FirebaseAuthException catch (e) {
      // do nothing ???
    }
  }
}
