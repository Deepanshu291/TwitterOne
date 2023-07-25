import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fwitter/core/provider.dart';
import '../core/core.dart';

final authApiProvider = Provider((ref) {
  return AuthApi(account: ref.watch(appwriteAccountProvider));
});

abstract class IAuthapi {
  FutureEither<model.User> signup(
      {required String email, required String password});
}

class AuthApi extends IAuthapi {
  final Account _account;

  AuthApi({required Account account}) : _account = account;

  @override
  FutureEither<model.User> signup(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message ?? " Some unexpected error ", stackTrace));
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
