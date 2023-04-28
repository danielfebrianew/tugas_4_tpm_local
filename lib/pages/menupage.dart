import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_4_tpm_2/pages/favoritepage.dart';
import 'package:tugas_4_tpm_2/pages/memberpage.dart';
import 'package:tugas_4_tpm_2/pages/weblistpage.dart';
import 'package:tugas_4_tpm_2/wigdets/cards_widget.dart';
import 'package:tugas_4_tpm_2/wigdets/stopwatch_widget.dart';

const Color _firstColor = Color(0xff77aca2);
const Color _secondColor = Color(0xff031926);

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(color: _firstColor),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 80),
          HomeCard(
            text: 'Daftar Anggota',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MemberPage(),
                ),
              );
            },
          ),
          HomeCard(
            text: 'Aplikasi Stopwatch',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StopwatchWidget(),
                ),
              );
            },
          ),
          HomeCard(
            text: 'Daftar Situs',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WebListPage(),
                ),
              );
            },
          ),
          HomeCard(
            text: 'Favorite',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritePage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _welcomeUser(),
        ],
      ),
    );
  }

  Widget _welcomeUser() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.all(20),
      child: Text(
        'signed in as ${user?.email}',
        style: const TextStyle(
          color: _secondColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
