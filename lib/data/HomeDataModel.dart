class Specialization {
  final int id;
  final String name;
  final List<Doctor> doctors;

  Specialization({required this.id, required this.name, required this.doctors});

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'],
      name: json['name'],
      doctors: (json['doctors'] as List)
          .map((doctorJson) => Doctor.fromJson(doctorJson))
          .toList(),
    );
  }
}

class Doctor {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final SpecializationInfo specialization;
  final City city;
  final double appointPrice;
  final String startTime;
  final String endTime;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photo: json['photo'],
      gender: json['gender'],
      address: json['address'],
      description: json['description'],
      degree: json['degree'],
      specialization: SpecializationInfo.fromJson(json['specialization']),
      city: City.fromJson(json['city']),
      appointPrice: (json['appoint_price'] as num).toDouble(),
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}

class SpecializationInfo {
  final int id;
  final String name;

  SpecializationInfo({required this.id, required this.name});

  factory SpecializationInfo.fromJson(Map<String, dynamic> json) {
    return SpecializationInfo(
      id: json['id'],
      name: json['name'],
    );
  }
}

class City {
  final int id;
  final String name;
  final Governrate governrate;

  City({required this.id, required this.name, required this.governrate});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      governrate: Governrate.fromJson(json['governrate']),
    );
  }
}

class Governrate {
  final int id;
  final String name;

  Governrate({required this.id, required this.name});

  factory Governrate.fromJson(Map<String, dynamic> json) {
    return Governrate(
      id: json['id'],
      name: json['name'],
    );
  }
}