import 'package:app/models/person.dart';

import 'customer.dart';

class Ticket {
  Ticket({this.id, this.location, this.description, this.person, this.customer, this.technician});

  final String id;
  final String location;
  final String description;
  final Person person;
  final Customer customer;
  final Person technician;

  getId() => this.id;

  getLocation() => this.location;

  getDescription() => this.description;

  getPerson() => this.person;

  getCustomer() => this.customer;

  getTechnician() => this.technician;
}
