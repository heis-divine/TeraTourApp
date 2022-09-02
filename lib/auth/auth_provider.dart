import 'auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser;

  Future<AuthUser?> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser?> createUser(
      {required String email,
      required String password,
      required String fullName});
  //Future<void> registerUser({required String uid,required String fullName,required String email});
  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String toEmail});
}
