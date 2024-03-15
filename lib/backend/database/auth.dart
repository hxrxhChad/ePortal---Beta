import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/index.dart';

class AuthService {
  String loginFormError(String email, String password) {
    if (email.isEmpty) {
      return "Email can't be empty";
    } else if (password.isEmpty) {
      return "Password can't be empty";
    } else if (password.length < 8) {
      return "Password can't be less than 8 characters";
    } else {
      return 'null';
    }
  }

  String registerFormError(String name, String organizationName, String email,
      String password, String photo, String admin) {
    if (email.isEmpty) {
      return "Email can't be empty";
    } else if (photo.isEmpty) {
      return "Email can't be empty";
    } else if (password.isEmpty) {
      return "Password can't be empty";
    } else if (password.length < 8) {
      return "Password can't be less than 8 characters";
    } else if (name.isEmpty) {
      return "Name can't be empty";
    } else if (organizationName.isEmpty) {
      return "Organization Name can't be empty";
    } else if (photo.isEmpty) {
      return "Photo can't be empty";
    } else if (admin.isEmpty) {
      return "Admin status can't be empty";
    } else {
      return 'null';
    }
  }

  Future<String?> login(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential.user?.uid;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<User?> register(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }

  Future<void> registerCloud(String name, String organizationName, String email,
      String password, String photo, int time, String admin) async {
    AuthModel user = AuthModel(
      name: name,
      organizationName: organizationName,
      emailId: email,
      password: password,
      time: time,
      photo: photo,
      admin: admin,
    );

    final userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid);

    user.authId = userRef.id;
    final data = user.toJson();

    userRef.set(data);
  }

  Future<String> getAdminFromFirestore(String authId) async {
    // Assuming you have a 'users' collection in Firestore
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(authId).get();

    // Check if the document exists and contains the 'admin' field
    if (snapshot.exists &&
        snapshot.data() != null &&
        snapshot.data()!.containsKey('admin')) {
      // Return the value of the 'admin' field
      return snapshot.data()!['admin'];
    } else {
      // If the document doesn't exist or doesn't contain the 'admin' field, return a default value
      return 'null';
    }
  }
}
