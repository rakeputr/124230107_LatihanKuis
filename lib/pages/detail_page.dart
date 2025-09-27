import 'package:flutter/material.dart';
import 'package:latihan_kuis/data/menu_data.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String quantity = "";
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Order"),
        backgroundColor: Color(0xFFEF3C3B),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Image.asset(menuList[widget.index].imageUrl,
                width: double.infinity),
            SizedBox(
              height: 20,
            ),
            Text(
              menuList[widget.index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Harga : Rp ${menuList[widget.index].price}"),
            SizedBox(
              height: 20,
            ),
            _orderField(),
            SizedBox(
              height: 20,
            ),
            _submitButton(context),
            SizedBox(
              height: 20,
            ),
            Text(
              'Total harga: Rp $total',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderField() {
    return Container(
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          quantity = value;
        },
        decoration: InputDecoration(
          hintText: 'Jumlah Order',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF3C3B)),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF3C3B)),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            total = (int.tryParse(menuList[widget.index].price) ?? 0) *
                (int.tryParse(quantity) ?? 0);
          });
        },
        child: Text('Submit'),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 55),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFFEF3C3B)),
      ),
    );
  }
}
