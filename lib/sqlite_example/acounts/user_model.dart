class User{
  late final String _name,_password;

  User(this._name,this._password);

  User.map(dynamic obj){
    this._name=obj["name"];
    this._password=obj["password"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["password"] = _password;
    return map;
  }

}