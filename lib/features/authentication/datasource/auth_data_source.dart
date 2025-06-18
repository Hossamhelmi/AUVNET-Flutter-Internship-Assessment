import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthDataSource {
  Future<User?> signUp({
    required String email,
    required String password,
  });


  Future<User?> logIn({
    required String email,
    required String password,
  });


  Future<void> logOut();

  User? getCurrentUser();
}




