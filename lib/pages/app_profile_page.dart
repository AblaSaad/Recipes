// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:recipes/widget/profile_photo_widget.dart';

// class AppProfilePage extends StatefulWidget {
//   const AppProfilePage({super.key});

//   @override
//   State<AppProfilePage> createState() => _AppProfilePageState();
// }

// class _AppProfilePageState extends State<AppProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w800,
//             )),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Column(
//           children: [
//             ProfilePhoto(),
//             SizedBox(
//               height: 70,
//             ),
//             Column(
//               children: [
//                 Row(children: [],)
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _imagePicker = ImagePicker();

  User? _user;
  late String uid;
  late String displayName;
  late String email;
  late String photoUrl;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(user.uid).get();

      setState(() {
        _user = user;
        displayName = snapshot.data()?['displayName'] ?? '';
        email = snapshot.data()?['email'] ?? '';
        photoUrl = snapshot.data()?['photoUrl'] ?? '';
      });
    }
  }

  Future<void> _updateDisplayName(String newName) async {
    await _user!.updateDisplayName(newName);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_user!.uid)
        .update({'displayName': newName});
    setState(() {
      displayName = newName;
    });
  }

  Future<void> _uploadPhoto() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      final Reference ref =
          _storage.ref().child('profile').child('${_user!.uid}.png');

      final UploadTask uploadTask = ref.putFile(file);
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await _user!.updatePhotoURL(downloadUrl);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .update({'photoUrl': downloadUrl});

      setState(() {
        photoUrl = downloadUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _user != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: _uploadPhoto,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            photoUrl.isNotEmpty ? NetworkImage(photoUrl) : null,
                        child: photoUrl.isEmpty
                            ? Icon(
                                Icons.person,
                                size: 60,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Name'),
                  subtitle: Text(displayName),
                  onTap: () async {
                    final newName = await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        TextEditingController controller =
                            TextEditingController(text: displayName);
                        return AlertDialog(
                          title: Text('Update Name'),
                          content: TextField(
                            controller: controller,
                            decoration: InputDecoration(labelText: 'Name'),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('CANCEL'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(controller.text),
                              child: Text('SAVE'),
                            ),
                          ],
                        );
                      },
                    );
                    if (newName != null && newName.isNotEmpty) {
                      await _updateDisplayName(newName);
                    }
                  },
                ),
                ListTile(
                  title: Text('Email'),
                  subtitle: Text(email),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
