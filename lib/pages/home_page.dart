import 'package:flutter/material.dart';
import 'package:latihan_kuis/data/menu_data.dart';
import 'package:latihan_kuis/pages/detail_page.dart';
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
          )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: GridView.builder(
                itemCount: menuList.length,
                shrinkWrap: true, // biar gabung sama ScrollView utama apk
                physics: NeverScrollableScrollPhysics(), //offin scroll ganda
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // ini biar tampil per 2 kolom
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  return _menuCard(context, index);
                }),
          )
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

  Widget _menuCard(BuildContext context, int index) {
    final menu = menuList[index];

    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 209, 231, 241),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: SizedBox(
              height: 160,
              width: double.infinity,
              child: Image.asset(menuList[index].imageUrl, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(menuList[index].name),
          Text("Harga : ${menuList[index].price}"),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(index: index);
              }));
            },
            child: Text('Order'),
            style: ElevatedButton.styleFrom(
                // minimumSize: Size(double.infinity, 55),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue),
          )
        ],
      ),
    );
  }
}
