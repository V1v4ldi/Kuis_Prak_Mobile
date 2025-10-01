import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuis/data/food_list.dart';
import 'package:kuis/pages/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  Detail({super.key, required this.username, required this.dummyFoods});

  final String username;
  final Food dummyFoods;
  final inputValueC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String komposisi;
    komposisi = dummyFoods.ingredients.join(",");
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Home(username: username);
                  },
                ),
                (route) => false,
              );
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              ClipRRect(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(dummyFoods.image),
                ),
              ),
              SizedBox(height: 30),
              Text(dummyFoods.name),
              SizedBox(height: 30),
              Text("Harga: ${dummyFoods.price}"),
              SizedBox(height: 30),
              Text("Deskripsi: ${dummyFoods.description}"),
              SizedBox(height: 30),
              Text("Komposisi: $komposisi"),
              SizedBox(height: 30),
              MaterialButton(
                child: Text(
                  dummyFoods.recipeUrl,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                onPressed: () {
                  launchUrl(Uri.parse(dummyFoods.recipeUrl));
                },
              ),
              TextFormField(
                obscureText: true,
                enabled: true,
                controller: inputValueC,
                decoration: InputDecoration(labelText: "Input Jumlah Pesanan"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
