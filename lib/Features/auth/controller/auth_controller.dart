import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwitter/apis/Authapi.dart';

import '../../../Components/showsnakbar.dart';

final AuthControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authApi: ref.watch(authApiProvider));
});

class AuthController extends StateNotifier<bool> {
  final AuthApi _authApi;

  AuthController({required AuthApi authApi})
      : _authApi = authApi,
        super(false);

  void signup(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authApi.signup(email: email, password: password);

    res.fold((l) => showSnackBar(context, l.message), (r) => print(r.email));
  }
}
