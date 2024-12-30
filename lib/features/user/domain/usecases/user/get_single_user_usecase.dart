// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:whatsapp__clone/features/user/domain/entites/user_entity.dart';
import 'package:whatsapp__clone/features/user/domain/repository/user_repository.dart';

class GetSingleUserUsecase {
  UserRepository repository;
  GetSingleUserUsecase({required this.repository});



  Stream<List<UserEntity>> call(String uid)  {
    return repository.getSingleUser(uid);
  }
}
