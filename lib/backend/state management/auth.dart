import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/index.dart';
import '../database/index.dart';

class AuthCubit extends Cubit<AuthState> {
  final authService = AuthService();
  final shared = Shared();

  AuthCubit() : super(const AuthState()) {
    //
  }

  Future<void> login() async {
    if (authService.loginFormError(state.emailId, state.password) == 'null') {
      setStatus(Status.loading);
      try {
        final uid = await authService.login(state.emailId, state.password);
        setAuthId(uid!);
        await shared.setShared('authId', uid);
        String newAdmin = await authService.getAdminFromFirestore(authId);
        await shared.setShared('admin', newAdmin);
        setAdmin(newAdmin);

        debugPrint(uid);
        debugPrint(newAdmin);
        setStatus(Status.success);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          setStatus(Status.failure);
          setError('Please provide a valid email');
          return;
        } else if (e.code == 'user-disabled') {
          setStatus(Status.failure);
          setError('The account has been disabled');
          return;
        } else if (e.code == 'user-not-found') {
          setStatus(Status.failure);
          setError('Provided user account does not exist');
          return;
        } else if (e.code == 'wrong-password') {
          setStatus(Status.failure);
          setError('You provided a wrong password');
          return;
        }
      }
    } else {
      setStatus(Status.failure);
      setError(authService.loginFormError(emailId, password));
      return;
    }
  }

  Future<void> register() async {
    String formError = authService.registerFormError(
        name, organizationName, emailId, password, photo, admin);
    if (formError == 'null') {
      setStatus(Status.loading);
      try {
        final user = await authService.register(emailId, password);
        if (user != null) {
          try {
            await authService.registerCloud(name, organizationName, emailId,
                password, photo, DateTime.now().millisecondsSinceEpoch, admin);
            setAuthId(authId);
            setAdmin(admin);
            await shared.setShared('authId', authId);
            await shared.setShared('admin', admin);
            setStatus(Status.success);
          } catch (e) {
            setStatus(Status.failure);
            setError('Unable to Save the Registered Data');
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          setStatus(Status.failure);
          setError('Please provide a valid email');
          return;
        } else if (e.code == 'email-already-in-use') {
          setStatus(Status.failure);
          setError('The email address is already in use by another account');
          return;
        } else if (e.code == 'operation-not-allowed') {
          setStatus(Status.failure);
          setError('Provided operation is not allowed');
          return;
        } else if (e.code == 'weak-password') {
          setStatus(Status.failure);
          setError(
              'You provided a very weak password, Please try again with a strong password');
          return;
        }
      }
    } else {
      setStatus(Status.failure);
      setError(formError);
      return;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    setAuthId('null');
    setAdmin('null');
    await shared.setShared('authId', 'null');
    await shared.setShared('admin', 'null');
  }

  Future<void> addImage() async {
    String? image = await uploadPhoto();
    setPhoto(image!);
  }

  void setAuthId(String authId) => emit(state.copyWith(authId: authId));
  void setName(String name) => emit(state.copyWith(name: name));
  void setOrganizationName(String organizationName) =>
      emit(state.copyWith(organizationName: organizationName));
  void setEmailId(String emailId) => emit(state.copyWith(emailId: emailId));
  void setPassword(String password) => emit(state.copyWith(password: password));
  void setPhoto(String photo) => emit(state.copyWith(photo: photo));
  void setAdmin(String admin) => emit(state.copyWith(admin: admin));
  void setError(String error) => emit(state.copyWith(error: error));
  void setStatus(Status status) => emit(state.copyWith(status: status));

  String get authId => state.authId;
  String get name => state.name;
  String get organizationName => state.organizationName;
  String get emailId => state.emailId;
  String get password => state.password;
  String get photo => state.photo;
  String get admin => state.admin;
  String get error => state.error;
  Status get status => state.status;
}

class AuthState extends Equatable {
  final String authId;
  final String name;
  final String organizationName;
  final String emailId;
  final String password;
  final String photo;
  final String admin;
  final String error;
  final Status status;

  const AuthState({
    this.authId = '',
    this.name = '',
    this.organizationName = '',
    this.emailId = '',
    this.password = '',
    this.photo = '',
    this.admin = '',
    this.error = '',
    this.status = Status.initial,
  });

  AuthState copyWith({
    String? authId,
    String? name,
    String? organizationName,
    String? emailId,
    String? password,
    String? photo,
    String? admin,
    String? error,
    Status? status,
  }) {
    return AuthState(
      authId: authId ?? this.authId,
      name: name ?? this.name,
      organizationName: organizationName ?? this.organizationName,
      emailId: emailId ?? this.emailId,
      password: password ?? this.password,
      photo: photo ?? this.photo,
      admin: admin ?? this.admin,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        authId,
        name,
        organizationName,
        emailId,
        password,
        photo,
        admin,
        error,
        status,
      ];
}

enum Status { initial, loading, success, failure }
