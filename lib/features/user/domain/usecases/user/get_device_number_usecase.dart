// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:whatsapp__clone/features/user/domain/entites/contact_entity.dart';
import 'package:whatsapp__clone/features/user/domain/repository/user_repository.dart';

class GetDeviceNumberUsecase {
  UserRepository repository;
  GetDeviceNumberUsecase({required this.repository});

  Future<List<ContactEntity>> call() async {
    return repository.getDeviceNumber();
  }
}
