import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ProfileScreen({super.key});
  String? profilepic;
  TextEditingController name = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isSaving = false;
  bool selection = false;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      name.text = snapshot['name'];
      profilepic = snapshot['profilepic'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 70,
                ),
                Positioned(
                  top: 25,
                  left: 7,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
                const Positioned.fill(
                    bottom: 7,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Profile Page',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        )))
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () async {
                    final XFile? pickImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickImage != null) {
                      setState(() {
                        profilepic = pickImage.path;
                        selection = true;
                      });
                    }
                  },
                  child: Container(
                      child: profilepic == null
                          ? CircleAvatar(
                              radius: 80,
                              child: Image.asset(
                                'assets/images/avatar.png',
                              ),
                            )
                          : profilepic!.contains('http')
                              ? CircleAvatar(
                                  radius: 80,
                                  backgroundImage: NetworkImage(profilepic!),
                                )
                              : CircleAvatar(
                                  radius: 80,
                                  backgroundImage: FileImage(File(profilepic!)),
                                ))),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                controller: name,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  label: Text(
                    ' Name',
                    style: TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || (value.isEmpty)) {
                    return 'Name Is Required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    backgroundColor: const Color(0xffF55A00)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    SystemChannels.textInput.invokeMapMethod('TextInput.hide');
                    profilepic == null
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Select Profile Pic")))
                        : name.text.isEmpty
                            ? saveInfo()
                            : updateInfo();
                  }
                },
                child: Text(
                  name.text.isEmpty ? 'Save' : 'Update',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }

  String? downloadUrl;
  Future<String?> uploadImage(File filePath, String? reference) async {
    try {
      final finalName =
          " ${FirebaseAuth.instance.currentUser!.uid}${DateTime.now().second}";
      final Reference fbStorge = FirebaseStorage.instance
          .ref(reference)
          .child(finalName)
          .child('${FirebaseAuth.instance.currentUser!.uid}.png');
      final UploadTask uploadTask = fbStorge.putFile(filePath);
      await uploadTask.whenComplete(() async {
        downloadUrl = await fbStorge.getDownloadURL();
      });
      return downloadUrl!;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  updateInfo() {
    setState(() {
      isSaving = true;
    });
    if (selection == true) {
      uploadImage(File(profilepic!), 'profile').whenComplete(() {
        Map<String, dynamic> data = {
          'name': name.text,
          'profilepic': downloadUrl
        };
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(data)
            .whenComplete(() {
          FirebaseAuth.instance.currentUser!.updateDisplayName(name.text);
          setState(() {
            isSaving = false;
          });
        });
      });
    } else {
      Map<String, dynamic> data = {'name': name.text, 'profilepic': profilepic};
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(data)
          .whenComplete(() {
        FirebaseAuth.instance.currentUser!.updateDisplayName(name.text);
        setState(() {
          isSaving = false;
        });
      });
    }
  }

  saveInfo() {
    setState(() {
      isSaving = true;
    });
    uploadImage(File(profilepic!), 'profile').whenComplete(() {
      Map<String, dynamic> data = {
        'name': name.text,
        'profilepic': downloadUrl
      };
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(data)
          .whenComplete(() {
        FirebaseAuth.instance.currentUser!.updateDisplayName(name.text);
        setState(() {
          isSaving = false;
        });
      });
    });
  }
}
