import 'package:chat_call_app/Pages/login_page.dart';
import 'package:chat_call_app/Pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially show the login page 
  bool showLoginPage = true;

  //toggle between login and register page
void togglePages(){
  setState(() {
    showLoginPage = !showLoginPage;
  });
}

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTop: togglePages);
    }else{
      return RegisterPage(onTap: togglePages);
    }
  }
}