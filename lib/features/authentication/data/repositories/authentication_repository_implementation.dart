import 'package:assignment9/core/dependency_injection/di_container.dart';
import 'package:assignment9/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:assignment9/features/authentication/data/models/user_model.dart';
import 'package:assignment9/features/authentication/domain/entities/user_entity.dart';
import 'package:assignment9/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  final AuthenticationDatasource _authenticationDatasource =
      locator<AuthenticationDatasource>();

  @override
  Future<String> signInUser(UserEntity user) async {
    return await _authenticationDatasource.signInUser(user as UserModel);
  }

  @override
  Future<String> signUpUser(UserEntity user) async {
    return await _authenticationDatasource.signUpUser(
        user as UserModel);
  }
}
