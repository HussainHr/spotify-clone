import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone_flutter/data/models/auth/create_user_reg.dart';
import 'package:spotify_clone_flutter/data/models/auth/sign_in_user.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReg createUserReg);
  Future<Either> signIn(SignInUserModel userModel);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUserModel userModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userModel.email, password: userModel.password);

      return const Right('SignIn was successfully');
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == "user-not-found") {
        message = "No user found for that email";
      } else if (e.code == "wrong-password") {
        message = "Wrong password provided for that user";
      } else {
        message = e.message ?? "An unknown error occurred";
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReg createUserReg) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: createUserReg.email, password: createUserReg.password);

      await userCredential.user?.updateDisplayName(createUserReg.fullName);

      FirebaseFirestore.instance.collection('Users').doc(userCredential.user?.uid).set({
        "name": createUserReg.fullName,
        "email": userCredential.user?.email,
      });
      
      return const Right('SignUp was successfully');
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == "weak-password") {
        message = "The password you provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exists with that email";
      } else if (e.code == "invalid-email") {
        message = "The email address is not valid";
      } else {
        message = e.message ?? "An unknown error occurred";
      }
      return Left(message);
    }
  }
}
