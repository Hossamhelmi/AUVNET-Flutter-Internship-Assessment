import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/core/firebase/firebase_helper.dart';
import 'package:nawel/features/authentication/datasource/auth_data_source.dart';

class AuthRepository implements AuthDataSource {
  final FirebaseHelper _firebaseAuthService;

  AuthRepository({required FirebaseHelper firebaseAuthService})
      : _firebaseAuthService = firebaseAuthService;

  @override
  Future<User?> signUp({
    required String email,
    required String password,
  }) {
    return _firebaseAuthService.signUp(
      email: email,
      password: password,

    );
  }
  @override
  Future<User?> logIn({
    required String email,
    required String password,
  }) {
    return _firebaseAuthService.logIn(
      email: email,
      password: password,
    );
  }
  @override
  Future<void> logOut() async {
    await _firebaseAuthService.logOut();
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuthService.getCurrentUser();
  }


}