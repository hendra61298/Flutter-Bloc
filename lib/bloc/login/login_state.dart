
import '../../utils/helper/form_submission_status.dart';

class LoginState{
 final String username;
 bool get isRequiredUsername => username != "";

 final String password;
 bool get isRequiredPassword => password != "";

 final FormSubmissionStatus formStatus;

 LoginState({
   this.username = "",
   this.password = "",
   this.formStatus= const InitialFormStatus()
 });

  LoginState copyWith(
      String? username,
      String? password,
      FormSubmissionStatus? formStatus,
  ){
     return LoginState(
         username: username ?? this.username,
         password: password ?? this.password,
         formStatus: formStatus ??this.formStatus);
    }
}