class User {
  User.guest();
  User(this.username, this.email);

  String username = 'Guest';
  String email = '';
  double budget = 0;
  Map documents = {};

  String getUsername() {
    return username;
  }

  String getEmail() {
    return email;
  }

  double getBudget() {
    return budget;
  }

  Map getDocuments() {
    return documents;
  }

  void addToDocuments(var key, var value) {
    documents[key] = value;
  }

  void setUsername(String username) {
    this.username = username;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setBudget(double budget) {
    this.budget = budget;
  }
}
