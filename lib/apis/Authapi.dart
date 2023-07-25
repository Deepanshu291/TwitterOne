import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fwitter/core/provider.dart';
import '../core/core.dart';

final authApiProvider = Provider((ref) {
  return AuthApi(account: ref.watch(appwriteAccountProvider));
});

abstract class IAuthapi {
  FutureEither<User> signup({required String email, required String password});

  FutureEither<Session> login(
      {required String email, required String password});

  Future<User?> currentUserAccount();
}

class AuthApi extends IAuthapi {
  final Account _account;

  AuthApi({required Account account}) : _account = account;

  @override
  Future<User?> currentUserAccount() async {
    try {
      return await _account.get();
    } on AppwriteException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  FutureEither<User> signup(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message ?? "Some unexpected error", stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<Session> login(
      {required String email, required String password}) async {
    try {
      final session =
          await _account.createEmailSession(email: email, password: password);
      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message ?? "Some unexpected error", stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}

// class AuthApi extends IAuthapi {
//   @override
//   void signup() {
//     // TODO: implement signup
//   }
// }
