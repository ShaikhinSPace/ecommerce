class User {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String token;
  final bool? isLoggedIn;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.image,
      required this.token,
      this.isLoggedIn = false});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'] ?? 'first name',
      lastName: json['lastName'] ?? 'last name',
      gender: json['gender'] ?? 'male',
      image: json['image'] ?? 'image',
      token: json['token'] ?? 'token',
      isLoggedIn: json['isLoggedIn'] ?? 'isLoggedIn');
}
