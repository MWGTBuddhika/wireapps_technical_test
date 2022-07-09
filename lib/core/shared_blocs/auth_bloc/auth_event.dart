part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class SignIn extends AuthEvent {
  const SignIn();
}
class SignOut extends AuthEvent {
  const SignOut();
}
class SignUp extends AuthEvent{
  const SignUp();
}
class CheckSignedIn extends AuthEvent {
  const CheckSignedIn();
}
class ClearTempData extends AuthEvent {
  const ClearTempData();
}
class FormFieldChanged extends AuthEvent{
  final String value;
  final FieldType fieldType;
  const FormFieldChanged(this.value,this.fieldType);
}
class ToggleRememberMe extends AuthEvent {
  const ToggleRememberMe();
}
