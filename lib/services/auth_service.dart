import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<void> signInWithGoogle() async {
    //create an instance of firebase auth and google signin
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //trigger the authentification flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    //obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    //create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //sign in the user with the credentials
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);

    print(userCredential);
  }

  Future<void> logOut() async {
    final GoogleSignIn googleSign = GoogleSignIn();
    await googleSign.signOut();
    print("looog out ");
  }
}
