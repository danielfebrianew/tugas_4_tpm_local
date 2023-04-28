import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_4_tpm_2/pages/loginpage.dart';

const Color _firstColor = Color(0xff77aca2);
const Color _secondColor = Color(0xff031926);

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _helpText(
                '\t\t\t\t Untuk dapat menggunakan aplikasi, pertama tama kita harus melakukan pendaftaran akun. Setelah berhasil mendaftarkan akun, kita akan dihadapkan pada loginpage. Dalam menu login ini kita bisa memasukkan email dan password yang telah kita daftarkan tadi. Selanjutnya akan tersedia dua menu dalam aplikasi, yaitu menu Home yang berisi menu aplikasi da njuga menu Help yang berisi tutorial penggunaan aplikasi ini dan juga tombol logout.'),
            const SizedBox(height: 20),
            _helpText(
                '\t\t\t\t Selanjutnya dalam menu aplikasi pada home kita dapat memilih 4 menu. Profile pembuat, stopwatc, list film dan favorite. Pada profile pembuat isiny biasa saja. pada Stopwatch kita bisa menggunakan 3 tombol yaitu Start dan Pause yang menjadi satu tombol, logo bendera yang dapat digunakan untuk menandai lap dari waktu dan juga menu reset untuk menghapus lap dan juga reset waktu ke 00:00:00.'),
            const SizedBox(height: 20),
            _helpText(
                '\t\t\t\t Selanjutnya ada aplikasi berisi card dengan rekomendasi film yang ada. Card ini apabila dipencet akan redirect kita ke halaman imdb yang berisi detail dari film tersebut. Apabila kita memencet tombol (+) yang ada pada bagian kanan card, kita akan memasukkan film tersebut ke list favorite pada menu selanjutnya. Pada menu favorit sendiri kita dapat menghapus card dari favorite'),
            const SizedBox(height: 20),
            _logoutButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _helpText(String text) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        style: const TextStyle(
          color: _secondColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _logoutButton() {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: _firstColor,
          backgroundColor: _secondColor,
          shadowColor: Colors.black,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(90, 40),
        ),
        child: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
      ),
    );
  }
}
