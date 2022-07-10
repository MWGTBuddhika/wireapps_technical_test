
class UserModel{
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  const UserModel({this.email, this.password, this.firstName, this.lastName});

  factory UserModel.fromJson(Map<String,dynamic>json)=>
      UserModel(
          email: json['email'],
        password: json['password'],
        firstName: json['firstName'],
        lastName: json['lastName'],

      );
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "firstName":firstName,
      "lastName":lastName,
    };
  }
}