class UserModel {
  final int? id;
  final String? uuid;
  final String? firstName;
  final String? lastName;
  final String? userName;
  final String? password;
  final String? email;
  final String? ip;
  final String? macAddress;
  final String? website;
  final String? image;

  UserModel({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.userName,
    this.password,
    this.email,
    this.ip,
    this.macAddress,
    this.website,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      uuid: json['uuid'],
      firstName: json['firstname'],
      lastName: json['lastname'],
      userName: json['username'],
      password: json['password'],
      email: json['email'],
      ip: json['ip'],
      macAddress: json['macAddress'],
      website: json['website'],
      image: json['image'],
    );
  }
}
