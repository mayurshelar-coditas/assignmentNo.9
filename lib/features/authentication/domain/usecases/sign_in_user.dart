import 'package:assignment9/core/dependency_injection/di_container.dart';
import 'package:assignment9/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:assignment9/features/authentication/domain/entities/user_entity.dart';
import 'package:assignment9/features/authentication/domain/repositories/authentication_repository.dart';

class SignInUser {
  final AuthenticationRepository _authenticationRepository =
      locator<AuthenticationRepositoryImplementation>();

  Future<String> call(UserEntity user) async {
    return await _authenticationRepository.signInUser(user);
  }
}
