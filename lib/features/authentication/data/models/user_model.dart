import 'package:assignment9/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.password,
  });
}
