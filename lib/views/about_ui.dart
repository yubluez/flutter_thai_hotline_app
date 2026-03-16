import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สายด่วน THAILAND",
            style: TextStyle(color: Colors.indigo[900])),
        backgroundColor: Colors.deepPurple[200],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40.0),
            Text(
              'ผู้จัดทำ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 20.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/sau.png',
                width: 150.0,
                height: 150.0,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 150.0,
                  width: 150.0,
                  color: Colors.grey[300],
                  child: Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              "มหาวิทยาลัยเอเชียอาคเนย์",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 50.0),
            CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(height: 20.0),
            Text(
              "6752410019",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 15.0),
            Text(
              "บัญจรัตน์ วรอนุ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 15.0),
            Text(
              "s6752410019@sau.ac.th",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 15.0),
            Text(
              "สาขาเทคโนโลยีดิจิทัลและนวัตกรรม",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 15.0),
            Text(
              "คณะศิลปศาสตร์และวิทยาศาสตร์",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
