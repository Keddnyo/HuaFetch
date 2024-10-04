import '../../../../core/resource.dart';
import '../model/user.dart';

abstract class AuthRepository {
  Future<Resource<User>> signIn(String requestCode);

  void signOut(String loginToken);
}
