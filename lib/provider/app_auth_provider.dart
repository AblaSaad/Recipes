import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:recipes/pages/home.page.dart';
import 'package:recipes/pages/login.page.dart';
import 'package:recipes/pages/register.page.dart';
import '../utilis/toast_message_status.dart';
import '../widget/toast_message.widget.dart';

class AppAuthProvider extends ChangeNotifier {
  GlobalKey<FormState>? formKey;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;
  bool obsecureText = true;

  void providerInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  void providerDispose() {
    emailController = null;
    passwordController = null;
    formKey = null;
    nameController = null;
    obsecureText = false;
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    notifyListeners();
  }

  void openRegisterPage(BuildContext context) {
    providerDispose();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const RegisterPage()));
  }

  void openLoginPage(BuildContext context) {
    providerDispose();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  String getUserName({required String? username}) {
    String result =
        username!.split(' ').take(2).map((word) => word[0]).join('');

    return result;
  }

  Future<void> signIn(BuildContext context) async {
    try {
      if (formKey?.currentState?.validate() ?? false) {
        OverlayLoadingProgress.start();
        var credentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController!.text,
                password: passwordController!.text);

        if (credentials.user != null) {
          OverlayLoadingProgress.stop();
          providerDispose();
          OverlayToastMessage.show(
            widget: const ToastMessageWidget(
              message: 'You Login Successully',
              toastMessageStatus: ToastMessageStatus.success,
            ),
          );

          if (context.mounted) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomePage()));
          }
        }
        OverlayLoadingProgress.stop();
      }
    } on FirebaseAuthException catch (e) {
      OverlayLoadingProgress.stop();

      if (e.code == 'user-not-found') {
        OverlayToastMessage.show(
          widget: const ToastMessageWidget(
            message: 'user not found',
            toastMessageStatus: ToastMessageStatus.failed,
          ),
        );
      } else if (e.code == 'wrong-password') {
        OverlayToastMessage.show(
            widget: const ToastMessageWidget(
          message: 'Wrong password provided for that user.',
          toastMessageStatus: ToastMessageStatus.failed,
        ));
      } else if (e.code == "user-disabled") {
        OverlayToastMessage.show(
            widget: const ToastMessageWidget(
          message: 'This email Account was disabled',
          toastMessageStatus: ToastMessageStatus.failed,
        ));
      } else if (e.code == "invalid-credential") {
        OverlayToastMessage.show(
            widget: const ToastMessageWidget(
          message: 'invalid-credential',
          toastMessageStatus: ToastMessageStatus.failed,
        ));
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      OverlayToastMessage.show(textMessage: 'General Error $e');
    }
  }

  Future<void> signUp(BuildContext context) async {
    try {
      if (formKey?.currentState?.validate() ?? false) {
        OverlayLoadingProgress.start();
        var credentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController!.text,
                password: passwordController!.text);

        if (credentials.user != null) {
          await credentials.user?.updateDisplayName(nameController!.text);
          OverlayLoadingProgress.stop();
          providerDispose();

          if (context.mounted) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomePage()));
          }
        }
        OverlayLoadingProgress.stop();
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
    }
  }

  void signOut(BuildContext context) async {
    OverlayLoadingProgress.start();
    await Future.delayed(const Duration(seconds: 1));
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
          (route) => false);
    }
    OverlayLoadingProgress.stop();
  }

  // Future<void> updateUserPhoto() async {
  //   try {
  //     OverlayLoadingProgress.start();
  //     var imageUrl = await  PickImage(ImageSource.gallery);
  //     var refs =
  //         FirebaseStorage.instance.ref("profile/${imageUrl?.files.first.name}");
  //     if (imageUrl?.files.first.bytes != null) {
  //       await refs.putData(
  //         imageUrl!.files.first.bytes!,
  //         SettableMetadata(contentType: "image/png"),
  //       );
  //       await FirebaseAuth.instance.currentUser
  //           ?.updatePhotoURL(await refs.getDownloadURL());
  //       notifyListeners();
  //       OverlayToastMessage.show(
  //         textMessage: "Uploading Photo Successfully",
  //       );
  //     }

  //     OverlayLoadingProgress.stop();
  //   } catch (e) {
  //     OverlayLoadingProgress.stop();
  //     OverlayToastMessage.show(
  //       textMessage: "Uploading Photo Faild",
  //     );
  //   }
  // }

  // Future<void> removePhoto() async {
  //   await FirebaseAuth.instance.currentUser?.updatePhotoURL(null);
  //   notifyListeners();
  // }

  // Future<void> updateUserName(BuildContext context, String name) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: const Text('Update Name'),
  //           content: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 TextFormField(
  //                   controller: nameController,
  //                   style: const TextStyle(color: Colors.white),
  //                   decoration: const InputDecoration(
  //                     hintText: 'Enter Name',
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text(
  //                   'Ok',
  //                   style: TextStyle(color: Color(0xffF55A00)),
  //                 )),
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text('Cancel',
  //                     style: TextStyle(color: Color(0xffF55A00))))
  //           ],
  //         );
  //       });
  // }
}
