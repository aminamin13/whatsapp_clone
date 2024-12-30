// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:whatsapp__clone/features/user/domain/entites/user_entity.dart';
import 'package:whatsapp__clone/features/user/domain/repository/user_repository.dart';

class GetAllUsersUsecase {
  UserRepository repository;
  GetAllUsersUsecase ({required this.repository});



  Stream<List<UserEntity>> call()  {
    return repository.getAllUsers();
  }
}
