import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? photourl;
  final String? location;
  final String? fcmtoken;
  final Timestamp? addtime;

  const UserData({
    this.id,
    this.name,
    this.email,
    this.photourl,
    this.location,
    this.fcmtoken,
    this.addtime,
  });

  @override
  String toString() {
    return 'UserData(id: $id, name: $name, email: $email, photourl: $photourl, location: $location, fcmtoken: $fcmtoken, addtime: $addtime)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      photourl,
      location,
      fcmtoken,
      addtime,
    ];
  }
}
