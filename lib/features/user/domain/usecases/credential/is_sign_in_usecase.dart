// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:whatsapp__clone/features/user/domain/repository/user_repository.dart';

class IsSignInUsecase {
  UserRepository repository;
  IsSignInUsecase({required this.repository});

  Future<bool> call() async {
    return repository.isSignIn();
  }
}
