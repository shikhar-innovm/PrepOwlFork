import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../model/login_dto.dart';
import '../../../_utils/entities/api_response.dart';

abstract class LoginRepo {
  Future<APIResponse<LoginDTO>> googleLogin();
  Future<void> googleLogout();
}

class LoginRepoImp implements LoginRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<APIResponse<LoginDTO>> googleLogin() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential result =
          await _firebaseAuth.signInWithCredential(credential);

      LoginDTO loginDTO = LoginDTO(
          email: result.user?.email,
          photoUrl: result.user?.photoURL,
          name: result.user?.displayName,
          uid: result.user?.uid);
      return right(loginDTO);
    } else {
      return left(Failure(code: 500, response: 'Something went wrong'));
    }
  }

  @override
  Future<void> googleLogout() async {
    await _firebaseAuth.signOut();
  }
}
