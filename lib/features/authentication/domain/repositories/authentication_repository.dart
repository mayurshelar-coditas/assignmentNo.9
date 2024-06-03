import 'package:assignment9/features/authentication/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {
  Future<String> signInUser(UserEntity user);
  Future<String> signUpUser(UserEntity user);
}
