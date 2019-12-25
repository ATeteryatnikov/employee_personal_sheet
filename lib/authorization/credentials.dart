class Credentials {
  static Credentials _instance;
  
  String _login;
  String _password;
  
  String getLogin() {
    return _login;
  }
  
  String getPassword() {
    return _password;
  }
  
  void setLogin(String value) {
    _login = value;
  }
  
  void setPassword(String value) {
    _password = value;
  }
}