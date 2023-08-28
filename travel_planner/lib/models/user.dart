import 'package:travel_planner/models/setting.dart';
//import 'package:analyzer_plugin/utilities/pair.dart';

class User {
  void initialiseSettings(bool isUser) {
    _settings.add(Setting(
      first: true,
      name: 'setting',
      isSwitchable: true,
      updateValue: updateValue,
    ));
    _settings.add(Setting(
      name: 'budget',
      isSwitchable: false,
      values: List<int>.generate(10, (index) => (index + 1) * 100),
      updateValue: updateValue,
      last: true,
    ));
  }

  User.guest() {
    initialiseSettings(false);
  }
  User(this._username, this._email) {
    initialiseSettings(true);
  }

  String _username = 'Guest';
  String _email = '';
  double _budget = 0;
  Map _documents = {};
  List<Setting> _settings = [];
  List _settingsValues = [];

  void updateValue(String key, var value) {
    for (int i = 0; i < _settings.length; ++i) {
      if (_settings[i].name == key) _settingsValues[i] = value;
    }
  }

  String getUsername() {
    return _username;
  }

  String getEmail() {
    return _email;
  }

  double getBudget() {
    return _budget;
  }

  Map getDocuments() {
    return _documents;
  }

  List getSettings() {
    return _settings;
  }

  void addToDocuments(var key, var value) {
    _documents[key] = value;
  }

  void setUsername(String username) {
    _username = username;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setBudget(double budget) {
    _budget = budget;
  }
}
