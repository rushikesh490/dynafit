
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> signUp(String name, String email, String password) async {
    String res = "Some Error";
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
              email: email,
              password: password,
          );

      await firestore.collection("users").doc(credential.user!.uid).set({
            "name": name,
            "email": credential.user!.email,
            "uid": credential.user!.uid,
          });
      res = "Success";
    } catch (e,s) {
      print(e);
      print(s);
      res = e.toString();
    }

    return res;

  }

}