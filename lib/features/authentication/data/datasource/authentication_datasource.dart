import 'package:assignment9/core/services/firestore_services.dart';
import 'package:assignment9/features/authentication/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signInUser(UserModel user) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  Future<String> signUpUser(UserModel user) async {
    try {
      UserCredential userCredentials =
          await _auth.createUserWithEmailAndPassword(
              email: user.email, password: user.password);

      await _auth.currentUser!.updateDisplayName(user.name);
      await _auth.currentUser!.verifyBeforeUpdateEmail(user.email);
      await FirestoreServices.saveUser(
          user.name, user.email, userCredentials.user!.uid.toString());

      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }
}
