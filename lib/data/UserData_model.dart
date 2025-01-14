class UserModel {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;
  final String confirmationPassword;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.confirmationPassword
  });

// Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'password': password,
      'password_confirmation': confirmationPassword,
    };
  }

// Create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      password: json['password'],
      confirmationPassword: json['password_confirmation'],
    );
  }
}
