// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:whatsapp__clone/features/user/domain/repository/user_repository.dart';

class GetCurrentUidUsecase {
  UserRepository repository;
  GetCurrentUidUsecase({required this.repository});

  Future<String> call() async {
    return repository.getCurrentUID();
  }
}
