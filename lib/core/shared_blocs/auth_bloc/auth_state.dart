part of 'auth_bloc.dart';

enum AuthStatus {
  unknown,
  loading,
  authenticated,
  unauthenticated,
  authFailed,
}

extension AuthStatusExt on String {
  AuthStatus toAuthStatus() {
    return AuthStatus.values.firstWhere((value) => this == value.name,
        orElse: () => AuthStatus.unknown);
  }
}

class AuthState extends Equatable {
  const AuthState({
    required this.status,
    required this.currentUser,
    required this.tempUserData,
    required this.rememberMe
  });

  final AuthStatus status;
  final UserModel tempUserData;
  final UserModel currentUser;
  final bool rememberMe;

  factory AuthState.initial() {
    return const AuthState(
        status: AuthStatus.unknown,
      currentUser: UserModel(),
      tempUserData: UserModel(),
      rememberMe: true
    );
  }

  AuthState copyWith(
      {
      AuthStatus? status,
        UserModel? currentUser,
        UserModel? tempUserData,
        bool? rememberMe
      }) {
    return AuthState(
        status: status ?? this.status,
        currentUser: currentUser ?? this.currentUser,
        tempUserData:tempUserData?? this.tempUserData,
        rememberMe: rememberMe?? this.rememberMe);
  }


  factory AuthState.fromJson(Map<String, dynamic> json) {
    AuthState state = AuthState.initial();

    return state.copyWith(
      status: (json['status'] as String).toAuthStatus(),
      currentUser:UserModel.fromJson(json['currentUser']) ,
      tempUserData:UserModel.fromJson(json['tempUserData']) ,
        rememberMe:json['rememberMe']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status.name,
      "currentUser": currentUser.toJson(),
      "tempUserData": tempUserData.toJson(),
      "rememberMe":rememberMe
    };
  }

  @override
  List<Object?> get props => [
        status,
        currentUser,
    tempUserData,
    rememberMe
      ];

  @override
  String toString() {
    return ''' ''';
  }
}
