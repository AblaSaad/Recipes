import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  User? _user;
  String? _userName;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    _user = _auth.currentUser;
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('users').doc(_user!.uid).get();
    setState(() {
      _userName = snapshot.data()?['name'];
      _profileImageUrl = snapshot.data()?['profileImageUrl'];
    });
  }

  Future<void> _updateProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String fileName = _user!.uid + DateTime.now().toString();
      Reference reference =
          _storage.ref().child('profile_images').child('${_user!.uid}.png');
      UploadTask uploadTask = reference.putFile(File(pickedFile.path));
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      await _firestore
          .collection('users')
          .doc(_user!.uid)
          .update({'profileImageUrl': imageUrl});
      setState(() {
        _profileImageUrl = imageUrl;
      });
    }
  }

  Future<void> _updateUserName(String newName) async {
    await _firestore
        .collection('users')
        .doc(_user!.uid)
        .update({'name': newName});
    setState(() {
      _userName = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: _profileImageUrl != null
                      ? NetworkImage(_profileImageUrl!)
                      : null,
                ),
                Positioned(
                    bottom: -3,
                    left: 95,
                    child: IconButton(
                        onPressed: _updateProfileImage,
                        icon: const Icon(Icons.add_a_photo_outlined)))
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _userName ?? '',
              style: const TextStyle(fontSize: 20),
            ),
            ListTile(
              title: const Text('Name'),
              subtitle: Text(
                "${FirebaseAuth.instance.currentUser!.displayName}",
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              onTap: () async {
                final newName = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    TextEditingController _nameController =
                        TextEditingController();
                    return AlertDialog(
                      title: const Text('Update Name'),
                      content: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('CANCEL'),
                        ),
                        TextButton(
                          onPressed: () {
                            _updateUserName(_nameController.text);
                            Navigator.pop(context);
                          },
                          child: const Text('SAVE'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
