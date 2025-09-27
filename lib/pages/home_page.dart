import 'package:flutter/material.dart';
import 'package:latihan_kuis/pages/login_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo $username',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              'Mau makan apa hari ini?',
              style: TextStyle(fontSize: 14, color: Colors.white),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ), (route) => false);
            },
            icon: Icon(Icons.logout_outlined),
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showBanner(),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'Daftar Menu : ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ))
        ],
      )),
    );
  }

  Widget showBanner() {
    return Image.asset(
      'assets/images/banner.jpg',
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
    );
  }
}
