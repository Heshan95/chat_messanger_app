import 'package:chat_call_app/Components/my_button.dart';
import 'package:chat_call_app/Components/my_text_feild.dart';
import 'package:chat_call_app/Services/Auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTop;
  const LoginPage({super.key, required this.onTop});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in user
  void signIn() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
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
                "https://lottie.host/9d7a894e-0a36-4951-9448-f75257f19e00/QnkohcIyHR.json",
                width: 300,
                height: 300
              ),

              //Welcome msg
              const Text(
                "Welcome Back You\'ve Been Missed!",
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
              const SizedBox(height: 25),

              // sign in btn
              MyButton(onTap: signIn, text: "Sign In"),
              const SizedBox(height: 10),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a Member ?'),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTop,
                    child: const Text(
                      'Register Now',
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
