import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/app_auth_provider.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({super.key});

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuthProvider>(
      builder: (context, updatePhoto, _) => InkWell(
        customBorder: const CircleBorder(),
        onTap: () async {
          showPopover(
            context: context,
            direction: PopoverDirection.bottom,
            backgroundColor: Colors.white,
            width: 220,
            height: 150,
            arrowHeight: 30,
            arrowWidth: 40,
            bodyBuilder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ListTile(
                      title: const Text(
                        "Upload Photo",
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: const Icon(Icons.add_a_photo_outlined),
                      onTap: () async {
                        Navigator.pop(context);
                        // await updatePhoto.updateUserPhoto();
                      }),
                  ListTile(
                      title: const Text("remove Photo",
                          style: TextStyle(color: Colors.black)),
                      leading: const Icon(Icons.no_photography_outlined),
                      onTap: () async {
                        Navigator.pop(context);
                        // await updatePhoto.removePhoto();
                      }),
                ],
              ),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
                backgroundImage:
                    FirebaseAuth.instance.currentUser?.photoURL == null
                        ? null
                        : NetworkImage(
                            FirebaseAuth.instance.currentUser!.photoURL!),
                backgroundColor:
                    const Color.fromARGB(255, 213, 184, 184).withOpacity(0.5),
                radius: 60,
                child: FirebaseAuth.instance.currentUser?.photoURL == null
                    ? ListTile(
                        title: Text(updatePhoto.getUserName(
                          username: FirebaseAuth
                              .instance.currentUser?.displayName
                              .toString(),
                        )),
                      )
                    : null),
            const Positioned(
              left: 80,
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
