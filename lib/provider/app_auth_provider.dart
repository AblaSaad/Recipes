import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes/pages/login.page.dart';
import 'package:recipes/pages/register.page.dart';

class AppAuthProvider extends ChangeNotifier {
  late GlobalKey<FormState>? formKey;
  late TextEditingController? emailController;
  late TextEditingController? passwordController;
  TextEditingController? nameController;
  bool obsecureText = false;

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

  Future<void> signUp(BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController!.text,
        password: passwordController!.text,
      );
    } on FirebaseAuthException catch (e) {
    } catch (e) {}
  }

  Future<void> signIn(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController!.text, password: passwordController!.text);
    } on FirebaseAuthException catch (e) {}
  }
}
