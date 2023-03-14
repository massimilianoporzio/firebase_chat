import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/features/auth/domain/entities/user_data_entity.dart';

class UserDataModel extends UserData {
  const UserDataModel({
    String? id,
    String? name,
    String? email,
    String? photourl,
    String? location,
    String? fcmtoken,
    Timestamp? addtime,
  }) : super(
            id: id,
            name: name,
            email: email,
            photourl: photourl,
            location: location,
            fcmtoken: fcmtoken,
            addtime: addtime);

  factory UserDataModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return UserDataModel(
      id: data?['id'],
      name: data?['name'],
      email: data?['email'],
      photourl: data?['photourl'],
      location: data?['location'],
      fcmtoken: data?['fcmtoken'],
      addtime: data?['addtime'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (photourl != null) "photourl": photourl,
      if (location != null) "location": location,
      if (fcmtoken != null) "fcmtoken": fcmtoken,
      if (addtime != null) "addtime": addtime,
    };
  }
}
