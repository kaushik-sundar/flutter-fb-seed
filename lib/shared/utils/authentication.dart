import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseUser;
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

void fbLogin(
    [String email = "kaushik11091@gmail.com",
    String password = "google"]) async {
  final fbUser = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  print("Firebase login test");
  print(fbUser);
}

Future<FirebaseUser> googleSignIn() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  print("signed in " + user.displayName);
  return user;
}
