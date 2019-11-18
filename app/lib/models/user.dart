class User {
  User({this.id, this.username, this.firstName, this.lastName, this.email, this.password});

  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  getId() => this.id;

  getUsername() => this.username;

  getUser() => this.firstName;

  getPhone() => this.lastName;

  getProfile() => this.email;

  getPassword() => this.password;
}
