// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Signupmodel {

  String? name;
  String? email;
  String? password;
  String? id;
  Signupmodel({
    this.name,
    this.email,
    this.password,
    this.id,

  });





  Signupmodel copyWith({
    String? name,
    String? email,
    String? password,
    String? id,

  }) {
    return Signupmodel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
            id: id ?? this.id,

    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
            'id': id,

    };
  }

  factory Signupmodel.fromMap(Map<String, dynamic> map) {
    return Signupmodel(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
            id: map['id'] != null ? map['id'] as String : null,

    );
  }

  String toJson() => json.encode(toMap());

  factory Signupmodel.fromJson(String source) => Signupmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Signupmodel(name: $name, email: $email, password: $password)';

  @override
  bool operator ==(covariant Signupmodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password &&
            other.id == id;

  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode ^ id.hashCode;
}
