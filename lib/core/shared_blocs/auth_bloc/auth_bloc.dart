import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../feature/authentication/signup/utils/enums.dart';
import '../../../utils/entity/user_model.dart';
import '../../../utils/shared_widgets/alert_box.dart';
import '../../../utils/strings/error_strings.dart';
import '../../router/router_delegate.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() :
        super(AuthState.initial()) {
    on<SignIn>(_onSignIn);
    on<SignOut>(_onSignOut);
    on<CheckSignedIn>(_onCheckSignedIn);
    on<ClearTempData>(_onClearTempData);
    on<FormFieldChanged>(_onFormFieldChanged);
    on<SignUp>(_onSignUp);
    on<ToggleRememberMe>(_onToggleRememberMe);
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }

  Future<void> _onSignIn(SignIn event, emit) async {
      try {
        if(
        state.tempUserData.email!= "" && state.tempUserData.email != null &&
        state.tempUserData.password!= "" && state.tempUserData.password != null &&
        state.tempUserData.email == state.currentUser.email &&
        state.tempUserData.password == state.currentUser.password)
          {
            assignmentRouter.replaceAll([const HomeRoute()]);
            add(const ClearTempData());
          }
        else{
          AlertBox().showError(ErrorStrings.invalidUserNameOrPassword);
        }

      } catch (er) {
        AlertBox().showError(ErrorStrings.invalidUserNameOrPassword);
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      }
  }

  Future<void> _onCheckSignedIn(
      CheckSignedIn event,
    Emitter<AuthState> emit,
  ) async {
    if(state.rememberMe == true &&
    state.currentUser.email != null && state.currentUser.email != "" &&
    state.currentUser.password !=null && state.currentUser.password != "" )
      {
        assignmentRouter.replaceAll([const HomeRoute()]);
      }
    else{
      assignmentRouter.replaceAll([const WelcomeRoute()]);
    }

  }
  Future<void> _onSignOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    try{

    }
    catch(error){
      AlertBox().showError(ErrorStrings.signOutFailed);
    }
  }

  Future<void> _onClearTempData(
      ClearTempData event,
      Emitter<AuthState> emit,
      ) async {
    emit(state.copyWith(tempUserData:const UserModel()));
  }
  Future<void> _onFormFieldChanged(
      FormFieldChanged event,
      Emitter<AuthState> emit,
      ) async {
        emit(state.copyWith(tempUserData:UserModel(
          firstName: event.fieldType == FieldType.firstName? event.value: state.tempUserData.firstName,
          lastName: event.fieldType == FieldType.lastName? event.value: state.tempUserData.lastName,
          email: event.fieldType == FieldType.email? event.value: state.tempUserData.email,
          password: event.fieldType == FieldType.password? event.value: state.tempUserData.password,
        )));
  }
  Future<void> _onSignUp(
      SignUp event,
      Emitter<AuthState> emit,
      ) async {
      if((state.tempUserData.firstName != null && state.tempUserData.firstName != "" ) &&
          (state.tempUserData.lastName != null && state.tempUserData.lastName != "" ) &&
          (state.tempUserData.email != null && state.tempUserData.email != "" ) &&
          (state.tempUserData.password != null && state.tempUserData.password != "" ) )
        {
          emit(state.copyWith(currentUser:state.tempUserData));
          assignmentRouter.replace(SignInRoute());
          add(const ClearTempData());
        }
      else{
        AlertBox().showError(ErrorStrings.pleaseFillAllFields);
      }
  }
  Future<void> _onToggleRememberMe(
      ToggleRememberMe event,
      Emitter<AuthState> emit,
      ) async {
    emit(state.copyWith(rememberMe:!state.rememberMe));
  }


}
