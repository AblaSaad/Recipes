import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:recipes/pages/login.page.dart';

import 'package:recipes/widget/widget_scrollable.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late GlobalKey<FormState> fromKey;

  bool obsecureText = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fromKey = GlobalKey<FormState>();
    super.initState();
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black38),
          ),
          Form(
            key: fromKey,
            child: WidgetScrollable(
              isColumn: true,
              columnMainAxisAlignment: MainAxisAlignment.center,
              widgets: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 50, bottom: 25),
                  child: Image.asset('assets/images/Logo.png'),
                ),
                const Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      label: Text(
                        'Full Name',
                        style: TextStyle(
                            color: Color.fromARGB(130, 245, 245, 245)),
                      ),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value != null || (value?.isEmpty ?? false)) {
                        return 'Name Is Required';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      label: Text(
                        'Email Address',
                        style: TextStyle(
                            color: Color.fromARGB(130, 245, 245, 245)),
                      ),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value != null || (value?.isEmpty ?? false)) {
                        return 'Email Is Required';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: obsecureText,
                    decoration: InputDecoration(
                        label: const Text(
                          'Password',
                          style: TextStyle(
                              color: Color.fromARGB(130, 245, 245, 245)),
                        ),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                          onTap: () => toggleObsecure(),
                          child: Icon(obsecureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),
                    validator: (value) {
                      if (value != null || (value?.isEmpty ?? false)) {
                        return 'Password Is Required';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(400, 50),
                        backgroundColor: const Color(0xffF55A00)),
                    onPressed: () {
                      if (!(fromKey.currentState?.validate() ?? false)) {
                        GetIt.I
                            .get<SharedPreferences>()
                            .setBool('isLogin', true);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()));
                      }
                    },
                    child: const Text('Register',
                        style: TextStyle(color: Colors.white))),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          if (MediaQuery.of(context).viewInsets.bottom == 0)
            Positioned.fill(
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Already have an account?",
                            style: TextStyle(color: Colors.white)),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RegisterPage()));
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(color: Color(0xffF55A00)),
                          ),
                        )
                      ],
                    )),
              ),
            )
        ],
      ),
    );
  }
}
