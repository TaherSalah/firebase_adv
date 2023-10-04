import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../login/login_screen.dart';
import '../widget/loading_screen.dart';
import '../widget/validate.dart';
import 'controller/register_controller.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  bool isActive = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends StateMVC<RegisterScreen> {
  _RegisterScreenState() : super(RegisterController()) {
    con = RegisterController();
  }

  late RegisterController con;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                    child:
                        Image.asset(height: 150, 'assets/images/micLogo.png')),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Register Now',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: widget.userNameController,
                    onChanged: (data) {},
                    keyboardType: TextInputType.name,

                    validator: Validator.name,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Enter Your Name',
                        label: Text('User Name'),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: widget.emailController,
                    keyboardType: TextInputType.emailAddress,

                    onChanged: (data) {
                      // emailController.text = data;
                    },
                    validator: Validator.email,

                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Enter Your Email',
                        label: Text('Email'),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: widget.passwordController,
                    obscureText: widget.isActive,
                    onChanged: (data) {
                      // passwordController.text = data;
                    },

                    keyboardType: TextInputType.number,

                    validator: Validator.password,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: togglePassword,

                          child: widget.isActive
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        prefixIcon: const Icon(Icons.lock_open_outlined),
                        hintText: 'Enter Your Password',
                        label: const Text('password'),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: widget.phoneController,
                    onChanged: (data) {
                      // passwordController.text = data;
                    },
                    keyboardType: TextInputType.phone,
                    validator: Validator.mobilePhone,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone_android),
                        hintText: 'Enter Your phone number',
                        label: Text('phone'),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Are You Have Account ? '),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: const Text(
                        'Login Now',
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.deepPurple),
                        elevation: MaterialStatePropertyAll(10),
                        textStyle: MaterialStatePropertyAll(TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20))),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await con.register(context,
                            email: widget.emailController.text,
                            password: widget.passwordController.text);
                      }
                    },
                    child: const Text('Register')),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void togglePassword() {
    widget.isActive = !widget.isActive;
    setState(() {});
  }
}
