import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';
@immutable
class AuthUser{
  final String uid;
  final String? email;
  final bool isEmailVerified;
  const AuthUser(this.isEmailVerified, this.uid, this.email);
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified,user.uid,user.email);
}