import 'package:equatable/equatable.dart';

class UserData with EquatableMixin {
  String? name;
  String? email;
  String? imageUrl;
  String? docId;

  UserData();

  UserData.fromJson(Map<String, dynamic> data, String id) {
    docId = id;
    name = data['name'];
    imageUrl = data['imageUrl'];
    email = data['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "email": email,
    };
  }

  @override
  List<Object?> get props => [name, imageUrl, email];
}
