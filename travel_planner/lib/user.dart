class User {
  User.guest();
  User(this.username, this.email);

  String username = 'Guest';
  String email = '';
  double budget = 0;

  String getUsername() {
    return username;
  }

  String getEmail() {
    return email;
  }

  double getBudget() {
    return budget;
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
