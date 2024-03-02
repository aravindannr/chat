import 'package:chat/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  fnHandleGoogleBtnClick() {
    signInWithGoogle().then((value) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (val) => const HomePage()));
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/chat.png",
              height: 100,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.bus_alert,
            ),
            label: const Text(
              'Login with Google',
            ),
          ),
        ],
      ),
    );
  }
}
