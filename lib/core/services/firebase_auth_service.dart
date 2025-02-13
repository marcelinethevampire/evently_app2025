import 'package:evently_app/core/services/snack_bar_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService{
  static Future<bool> createAccount({
    required String email,
    required String password
}) async {
    EasyLoading.show();
    try{
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:email,
        password: password
      );
      SnackBarService.showSuccessMessage("Account Created Successfully");
      return Future.value(true);
    }
    on FirebaseAuthException catch(e){
      if(e.code == "Weak Password"){
        SnackBarService.showErrorMessage(e.message?? "The Password provided is weak");
        print("The Password is Weak !");
        return Future.value(false);


      } else if(e.code == 'email already used'){
        SnackBarService.showErrorMessage(e.message?? 'The accoount already exists!');
        print("The accoount already exists!");
        return Future.value(false);

      }
      return Future.value(false);
    }
    catch(e){
      return Future.value(false);
    }
  }
  static Future<bool> login({
    required String email,
    required String password
})
  async{
    EasyLoading.show();
    try{
      final userCredential  = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password) ;
      print(userCredential.credential?.accessToken);
      print(userCredential.user?.uid);
      SnackBarService.showSuccessMessage("Logged In Successfully");
      return Future.value(true);
    }
    on FirebaseAuthException catch(e){
      print(e.message);
      print(e.code);
      if(e.code == 'user not found'){
        SnackBarService.showErrorMessage(e.message?? 'No user found');
        return Future.value(false);
      }
      else if(e.code == 'Invalid Credential'){
        SnackBarService.showErrorMessage(e.message??'Wrong Password or Email ');
        return Future.value(false);
      }
      return Future.value(false);
    }catch(e){
      return Future.value(false);
    }
  }
}