import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_demo/resources/storage_method.dart';


class AuthMethods{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;

  //a function for signup user
  Future <String>signUpUser ({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
})async{
    String res="Some error occured";
    try{
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty || file!=null){
        // register user
        UserCredential cred =await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);
       String photoUrl= await StorageMethod().uploadImageToStorage("profile pics", file, false);
        //add user to our database
        _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'password':password,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl
        });
        res= 'success';
      }
    } catch(err){
        res = err.toString();
    }
    return res;
  }
  //create a function for logging in users
  Future<String> Login({
    required String email,
    required String password,
})async{
    String res= "some error occured";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
        print("login was successful");
      }else{
        res = "Please enter your credentials";
        print('login failed');
      }
    }catch(err){
      res= err.toString();
    }
    return res;
}

}