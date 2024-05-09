import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ShoesListApp(),
        ),
      ),
    );
  }
}

class ShoesListApp extends StatelessWidget {
  final List<Map<String, dynamic>> shoesList = [
    {
      'name': 'Ardiles 230',
      'deskripsi': 'Ardiles max 200',
      'imagePath': 'assets/images/gambar1.png',
      'backgroundColor': Color.fromARGB(255, 149, 255, 0),
    },
    {
      'name': 'Nike CR7',
      'deskripsi': 'New Nike Terbaru',
      'imagePath': 'assets/images/gambar2.png',
      'backgroundColor': Color.fromARGB(255, 0, 90, 246),
    },
    {
      'name': 'Nike Special',
      'deskripsi': 'Nike Origanal pro',
      'imagePath': 'assets/images/gambar3.png',
      'backgroundColor': Color.fromARGB(255, 255, 94, 94),
    },
    {
      'name': 'Slop Warna',
      'deskripsi': 'Slop Wanita terbaru',
      'imagePath': 'assets/images/gambar4.png',
      'backgroundColor': Color.fromARGB(255, 134, 129, 98),
    },
    {
      'name': 'Sepatu Pink',
      'deskripsi': 'Origanal Laos',
      'imagePath': 'assets/images/gambar5.png',
      'backgroundColor': Color.fromARGB(255, 255, 66, 205),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shoes',
          style: TextStyle(
            color: const Color.fromARGB(255, 75, 75, 75),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 8, right: 30, bottom: 8),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shoesList.length,
        itemBuilder: (context, index) {
          final shoes = shoesList[index];
          return ShoesCard(
            name: shoes['name'],
            deskripsi: shoes['deskripsi'],
            imagePath: shoes['imagePath'],
            backgroundColor: shoes['backgroundColor'],
          );
        },
      ),
    );
  }
}

class ShoesCard extends StatelessWidget {
  final String? name;
  final String? deskripsi;
  final String? imagePath;
  final Color? backgroundColor;

  const ShoesCard({
    this.deskripsi,
    this.name,
    this.imagePath,
    this.backgroundColor = Colors.lightBlue, // Default background color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? '',
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                deskripsi ?? '',
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Image(
            image: AssetImage(imagePath ?? ''),
            height: 150.0,
            width: 150.0,
          ),
        ],
      ),
    );
  }
}