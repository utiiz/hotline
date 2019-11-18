import 'package:app/models/person.dart';

class Customer {
  Customer({this.id, this.name, this.street, this.city, this.postalCode, this.persons, this.technician});

  final String id;
  final String name;
  final String street;
  final String city;
  final String postalCode;
  final List<Person> persons;
  final Person technician;

  getId() => this.id;

  getName() => this.name;

  getStreet() => this.street;

  getCity() => this.city;

  getPostalCode() => this.postalCode;

  getPersons() => this.persons;

  getTechnician() => this.technician;
}
