// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:whatsapp__clone/features/user/domain/repository/user_repository.dart';

class VerifyPhoneNumberUsecase {
  UserRepository repository;
  VerifyPhoneNumberUsecase({required this.repository});

  Future<void> call(String phoneNumber) async {
    return repository.verifyPhoneNumber(phoneNumber);
  }
}
