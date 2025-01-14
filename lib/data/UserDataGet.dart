class UserResponse {
  final bool status;
  final String message;
  final UserData data;

  UserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }
}

class UserData {
  final String name;
  final String email;

  UserData({
    required this.name,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}