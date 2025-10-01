import 'package:flutter/material.dart';
import 'package:kuis/data/food_list.dart';
import 'package:kuis/pages/detail.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.username});

  final String username;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"), 
        centerTitle: true,
        actions: [

        ],      
      ),
      body: Column(
        children: [
          Text("Selamat Datang: ${widget.username}"),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return _foodStore(context, index);
              },
              itemCount: dummyFoods.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _foodStore(BuildContext context, int index) {
    return InkWell(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
            ClipRRect(
              child: Image.network(dummyFoods[index].image)),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(dummyFoods[index].name),
                  Text(dummyFoods[index].category),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Detail(
                              dummyFoods: dummyFoods[index],
                              username: widget.username,
                          );
                        },
                      ),
                    );
                  },
                  child: Text("Pesan"),
                ),
                SizedBox(height: 40,)
              ],
            )
          ),
        ],
      ),  
      )
      ),
    );
  }

  void
}
