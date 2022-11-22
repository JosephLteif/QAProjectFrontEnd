class User {
  String? _name;
  String? _email;
  String? _phoneNumber;
  int? _id;

  User({String? name, String? email, String? phoneNumber, int? id}) {
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (phoneNumber != null) {
      this._phoneNumber = phoneNumber;
    }
    if (id != null) {
      this._id = id;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  int? get id => _id;
  set id(int? id) => _id = id;

  User.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['phoneNumber'] = this._phoneNumber;
    data['id'] = this._id;
    return data;
  }
}
