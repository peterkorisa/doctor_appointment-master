class SignUpStates {}

class SignUpInitialState extends SignUpStates {}
class SignUpLoadingState extends SignUpStates {}
class SignUpSuccessState extends SignUpStates {
  String token;
  SignUpSuccessState(this.token);
}
class SignUpErrorState extends SignUpStates {
  String errorMessage;
  SignUpErrorState(this.errorMessage);
}
