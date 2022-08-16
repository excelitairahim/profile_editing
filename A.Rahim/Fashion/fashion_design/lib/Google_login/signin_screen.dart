//import 'package:fashion_design/Google_login/gobal.dart';
import 'package:fashion_design/Google_login/userProfile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LogginScreen extends StatefulWidget {
  @override
  State<LogginScreen> createState() => _LogginScreenState();
}

class _LogginScreenState extends State<LogginScreen> {
  bool signin = true;
  //String daa='hi';
 
  Future<User?> signInWithGoogle() async {
    try {
      //SIGNING IN WITH GOOGLE
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      //CREATING CREDENTIAL FOR FIREBASE
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      //SIGNING IN WITH CREDENTIAL & MAKING A USER IN FIREBASE  AND GETTING USER CLASS
      final userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      //CHECKING IS ON
      assert(!user!.isAnonymous);
      assert(await user!.getIdToken() != null);

      final User? currentUser = await _auth.currentUser;
      assert(currentUser!.uid == user!.uid);
      print(user);

      if (user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => UserInfoScreen(
                      user: user,
                      signin: signin,
                    ))));
      }

      return user;
    } catch (e) {
      print(e);
    }
  }

  void signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SignInButton(Buttons.Google, onPressed: () {
            signInWithGoogle();
          }),
          ElevatedButton(onPressed: signOut, child: Text('SignOut'))
        ],
      )),
    );
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
 //final GoogleSignIn googleSignIn = GoogleSignIn();


