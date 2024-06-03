import 'package:assignment9/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:assignment9/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:assignment9/features/authentication/domain/usecases/sign_in_user.dart';
import 'package:assignment9/features/authentication/domain/usecases/sign_up_user.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton(AuthenticationDatasource());
  locator.registerSingleton(AuthenticationRepositoryImplementation());
  locator.registerSingleton(SignInUser());
  locator.registerSingleton(SignUpUser());
}
