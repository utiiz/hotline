class User {
  final String _name;
  final String _job;

  User({String name, String job})
      : _name = name,
        _job = job;

  String get name => _name;
  String get job => _job;
}
