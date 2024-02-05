import 'package:chat_call_app/Components/my_button.dart';
import 'package:chat_call_app/Components/my_text_feild.dart';
import 'package:chat_call_app/Services/Auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign up user
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password Do Not Match!"),
        ),
      );
      return;
    }

    //get auth service
    final authservice = Provider.of<AuthService>(context, listen: false);

    try {
      await authservice.signUpWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 10),

              //Logo
              // Icon(
              //   Icons.message,
              //   size: 100,
              //   color: Colors.grey[800],
              // ),
              // const SizedBox(height: 25),

              //Lotties log
              Lottie.network(
                "https://lottie.host/c2b05e1d-29c4-48fb-a50a-686724dad97b/s1Lld5cnkQ.json",
                width: 220,
                height: 220,
              ),

              //Create Acc msg
              const Text(
                "Let's Create New Account For You!",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),

              // email textfield
              MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false),
              const SizedBox(height: 10),

              //password textfield
              MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true),
              const SizedBox(height: 10),

              //confirm password textfield
              MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Re-Enter Password',
                  obscureText: true),
              const SizedBox(height: 25),

              // sign up btn
              MyButton(onTap: signUp, text: "Sign Up"),
              const SizedBox(height: 10),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a Member ?'),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
