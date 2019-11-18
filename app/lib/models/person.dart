import 'package:app/models/user.dart';
import 'package:app/models/profile.dart';

class Person {
  Person({this.id, this.user, this.phone, this.profile});

  final String id;
  final User user;
  final String phone;
  final Profile profile;

  getId() => this.id;

  getUser() => this.user;

  getPhone() => this.phone;

  getProfile() => this.profile;
}
