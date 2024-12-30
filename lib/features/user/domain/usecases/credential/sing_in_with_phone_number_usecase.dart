// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:whatsapp__clone/features/user/domain/repository/user_repository.dart';

class SingInWithPhoneNumberUsecase {
  UserRepository repository;
  SingInWithPhoneNumberUsecase({required this.repository});

  Future<void> call(String smsPinCode) async {
    return repository.signInWithPhoneNumber(smsPinCode);
  }
}
