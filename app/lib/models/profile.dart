class Profile {
  Profile({this.id, this.reference, this.name, this.rank});

  final String id;
  final String reference;
  final String name;
  final int rank;

  getId() => this.id;

  getReference() => this.reference;

  getName() => this.name;

  getRank() => this.rank;
}
