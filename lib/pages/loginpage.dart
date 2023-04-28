import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_4_tpm_2/pages/homepage.dart';
import 'package:tugas_4_tpm_2/pages/registrationpage.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

const Color _firstColor = Color(0xff77aca2);
const Color _secondColor = Color(0xff031926);

// ignore: camel_case_types
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// ignore: camel_case_types
class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(35, 40, 40, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: _secondColor,
            ),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  _textMasuk(),
                  const SizedBox(
                    height: 50,
                  ),
                  _emailField(),
                  const SizedBox(
                    height: 25,
                  ),
                  _passwordField(),
                  const SizedBox(
                    height: 45,
                  ),
                  _loginButton(),
                  const SizedBox(
                    height: 30,
                  ),
                  _buttonDaftar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textMasuk() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Masuk',
        style: TextStyle(
          color: _firstColor,
          fontSize: 45,
          fontFamily: 'Arial',
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _emailField() {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty || !value.contains('@')) {
            return 'Please Enter a valid Email!';
          } else {
            return null;
          }
        },
        enabled: true,
        controller: _emailController,
        style: const TextStyle(
          color: _firstColor,
        ),
        cursorColor: _firstColor,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.person,
            color: _firstColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: _firstColor,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          focusColor: Colors.white,
          filled: true,
          fillColor: const Color.fromARGB(255, 14, 14, 14),
          hintText: 'Email',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        key: const ValueKey('password'),
        validator: (value) {
          if (value!.isEmpty || value.length < 6) {
            return 'Please Enter a Password of min length!';
          } else {
            return null;
          }
        },
        enabled: true,
        controller: _passwordController,
        style: const TextStyle(
          color: _firstColor,
        ),
        cursorColor: _firstColor,
        obscureText: _obscureText,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.key,
            color: _firstColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: _firstColor,
              width: 3,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          filled: true,
          fillColor: const Color.fromARGB(255, 14, 14, 14),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: _firstColor,
            ),
          ),
          hintText: 'Password',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: _firstColor,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          minimumSize: const Size(90, 40),
        ),
        onPressed: () async {
          try {
            if (_formKey.currentState!.validate()) {
              await _firebaseAuth
                  .signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text)
                  .then((value) {
                SnackBar snackBar = const SnackBar(
                  content: Text("Login Success!"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              });
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              SnackBar snackBar = const SnackBar(
                content: Text("Login Failed! Wrong E-mail!"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (e.code == 'wrong-password') {
              SnackBar snackBar = const SnackBar(
                content: Text("Login Failed!Wrong Password!"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          } catch (e) {
            SnackBar snackBar = SnackBar(
              content: Text("Error : $e"),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: const Text(
          'Masuk',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buttonDaftar() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Belum punya akun?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistrationPage(),
                ),
              );
            },
            child: const Text(
              'Daftar',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
