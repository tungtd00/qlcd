// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? id;
  String? username;
  String? email;
  String? phone;
  String? password;
  String? createTime;
  String? updateTime;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.password,
    this.createTime,
    this.updateTime,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? phone,
    String? password,
    String? createTime,
    String? updateTime,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'createTime': createTime,
      'updateTime': updateTime,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      password: map['password'] as String,
      createTime:
          map['createTime'] != null ? map['createTime'] as String : null,
      updateTime:
          map['updateTime'] != null ? map['updateTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, phone: $phone, password: $password, createTime: $createTime, updateTime: $updateTime)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.email == email &&
        other.phone == phone &&
        other.password == password &&
        other.createTime == createTime &&
        other.updateTime == updateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        password.hashCode ^
        createTime.hashCode ^
        updateTime.hashCode;
  }
}
