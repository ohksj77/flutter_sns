import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/user_repo.dart';
import '../home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userRepo = UserRepo();

  void _submitButton() async {
    final prefs = await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String? token = await _userRepo.register(name, email, password);
      if (token != null) {
        await prefs.setString('token', token);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('회원가입'),
                const SizedBox(height: 20),
                const Text("이 프로젝트는 현장실습 프로젝트입니다."),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: '이름'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '이름은 필수입니다.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: '아이디(이메일)'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '아이디(이메일) 필수입니다.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: '비밀번호'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '비밀번호는 필수입니다.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: _submitButton, child: Text('가입하기'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
