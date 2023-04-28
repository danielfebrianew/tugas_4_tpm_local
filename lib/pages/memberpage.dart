import 'package:flutter/material.dart';

const Color _mainColor = Color(0xff77aca2);
const Color _secondColor = Color(0xff031926);

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: _secondColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: _mainColor,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: _secondColor),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration: const BoxDecoration(color: _secondColor),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                backgroundColor: _mainColor,
                radius: 125,
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage(
                    'assets/images/user.JPG',
                  ),
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                'Daniel Febrian E.W.',
                style: TextStyle(
                    color: _mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 7),
              const Text(
                '123200120',
                style: TextStyle(
                    color: _mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              const SizedBox(height: 7),
              const Text(
                'Teknologi Pemrograman Mobile IF-C',
                style: TextStyle(
                    color: _mainColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              Theme(
                data: ThemeData(
                  dividerTheme: const DividerThemeData(
                    thickness: 2,
                  ),
                ),
                child: const Divider(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                '\tSaya lahir di Surakarta, 04 Februari 2002. Saya memiliki beberapa hobi seperti bermain catur, melukis dan juga bermain musik. Harapan saya kedepannya adalah agar dapat lulus tepat waktu dan bisa menjadi programmer handal yang punya banyak uang.',
                style: TextStyle(
                  color: _mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
