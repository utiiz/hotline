class User {
  User({this.id, this.firstName, this.lastName, this.email, this.password});

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  getId() => this.id;

  getUser() => this.firstName;

  getPhone() => this.lastName;

  getProfile() => this.email;

  getPassword() => this.password;
}
