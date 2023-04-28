import 'package:flutter/material.dart';
import 'package:tugas_4_tpm_2/pages/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

const Color _firstColor = Color(0xff77aca2);
const Color _secondColor = Color(0xff031926);

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationpageState();
}

// ignore: camel_case_types
class _RegistrationpageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
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
                    height: 20,
                  ),
                  _textDaftar(),
                  const SizedBox(
                    height: 50,
                  ),
                  _emailField(),
                  const SizedBox(
                    height: 25,
                  ),
                  _passwordField(),
                  const SizedBox(
                    height: 30,
                  ),
                  _registerButton(),
                  const SizedBox(
                    height: 20,
                  ),
                  _loginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textDaftar() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Daftar',
        style: TextStyle(
          color: _firstColor,
          fontSize: 45,
          fontFamily: 'Arial',
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _emailField() {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        controller: _emailController,
        validator: (value) {
          if (value!.isEmpty || !value.contains('@')) {
            return 'Please Enter a valid Email!';
          } else {
            return null;
          }
        },
        enabled: true,
        cursorColor: _firstColor,
        style: const TextStyle(
          color: _firstColor,
        ),
        decoration: InputDecoration(
          icon: const Icon(
            Icons.email,
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
        controller: _passwordController,
        validator: (value) {
          if (value!.isEmpty || value.length < 6) {
            return 'Please Enter a Password of min length!';
          } else {
            return null;
          }
        },
        enabled: true,
        cursorColor: _firstColor,
        style: const TextStyle(
          color: _firstColor,
        ),
        obscureText: _obscureText,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.key,
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
          filled: true,
          fillColor: const Color.fromARGB(255, 14, 14, 14),
          hintText: 'Password',
          suffixIcon: GestureDetector(
            onTap: () {
              setState(
                () {
                  _obscureText = !_obscureText;
                },
              );
            },
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: _firstColor,
            ),
          ),
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: _secondColor,
          backgroundColor: _firstColor,
          shadowColor: Colors.black,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(90, 40),
        ),
        child: const Text(
          'Daftar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          try {
            if (_formKey.currentState!.validate()) {
              await _firebaseAuth
                  .createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text)
                  .then((userCredential) {
                SnackBar snackBar = const SnackBar(
                  content: Text("Register Success!"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
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
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sudah memiliki akun?',
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
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: const Text(
              'Masuk',
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
