import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwitter/Features/Home/view/HomeView.dart';
import 'package:fwitter/Features/auth/view/login_view.dart';
import 'package:fwitter/apis/Authapi.dart';
import '../../../Components/showsnakbar.dart';

final AuthControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authApi: ref.watch(authApiProvider));
});

final currenUserAccountProvider = FutureProvider((ref) async {
  final authController = ref.watch(AuthControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthApi _authApi;

  AuthController({required AuthApi authApi})
      : _authApi = authApi,
        super(false);

  Future<User?> currentUser() => _authApi.currentUserAccount();

  void signup(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authApi.signup(email: email, password: password);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, "Accounted created! Please Login.");
      Navigator.pushReplacement(context, LoginView.route());
    });
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authApi.login(email: email, password: password);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      Navigator.pushReplacement(context, HomeView.route());
    });
  }
}
