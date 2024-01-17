// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/pages/register.page.dart';
import 'package:recipes/provider/app_auth_provider.dart';
import 'package:recipes/widget/widget_scrollable.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context, listen: false).providerInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black38),
          ),
          Consumer<AppAuthProvider>(
            builder: (context, authProvider, _) => Form(
              key: authProvider.formKey,
              child: WidgetScrollable(
                isColumn: true,
                columnMainAxisAlignment: MainAxisAlignment.center,
                widgets: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 50, bottom: 25),
                    child: Image.asset('assets/images/Logo.png'),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextFormField(
                      controller: authProvider.emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
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
                      controller: authProvider.passwordController,
                      obscureText: authProvider.obsecureText,
                      decoration: InputDecoration(
                          label: const Text(
                            'Password',
                            style: TextStyle(
                                color: Color.fromARGB(130, 245, 245, 245)),
                          ),
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: InkWell(
                            onTap: () => authProvider.toggleObsecure(),
                            child: Icon(authProvider.obsecureText
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 11, 105, 104)),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(400, 50),
                          backgroundColor: Color(0xffF55A00)),
                      onPressed: () {
                        authProvider.signIn(context);
                      },
                      child:
                          Text('Login', style: TextStyle(color: Colors.white))),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RegisterPage()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Color(0xffF55A00)),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
