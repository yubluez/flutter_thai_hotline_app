// ignore_for_file: prefer_interpolation_to_compose_strings, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/hotline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SubAHomeUi extends StatefulWidget {
  const SubAHomeUi({super.key});

  @override
  State<SubAHomeUi> createState() => _SubAHomeUiState();
}

class _SubAHomeUiState extends State<SubAHomeUi> {
  List<Hotline> travelHotline = [
    Hotline(
      name: 'กรมทางหลวงชนบท',
      phone: '1146',
      image: 'assets/images/suba1.png',
    ),
    Hotline(
      name: 'ตำรวจท่องเที่ยว',
      phone: '1155',
      image: 'assets/images/suba2.png',
    ),
    Hotline(
      name: 'ตำรวจทางหลวง',
      phone: '1193',
      image: 'assets/images/suba3.png',
    ),
    Hotline(
      name: 'ข้อมูลจราจร',
      phone: '1197',
      image: 'assets/images/suba4.jpg',
    ),
    Hotline(
      name: 'ขสมก.',
      phone: '1348',
      image: 'assets/images/suba5.png',
    ),
    Hotline(
      name: 'บขส.',
      phone: '1490',
      image: 'assets/images/suba6.png',
    ),
    Hotline(
      name: 'เส้นทางบนทางด่วน',
      phone: '1543',
      image: 'assets/images/suba7.png',
    ),
    Hotline(
      name: 'กรมทางหลวง',
      phone: '1586',
      image: 'assets/images/suba8.png',
    ),
    Hotline(
      name: 'การรถไฟแห่งประเทศไทย',
      phone: '1690',
      image: 'assets/images/suba9.png',
    ),
  ];

  // ฟังก์ชันโทรออก
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          Text(
            'สายด่วน\nการเดินทาง',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/travel.jpg',
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 180,
                width: double.infinity,
                color: Colors.grey[300],
                child: Icon(Icons.image, size: 50, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          // รายการเบอร์โทร
          Expanded(
            child: ListView.separated(
              itemCount: travelHotline.length,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 4)),
                    ],
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    onTap: () => _makePhoneCall(travelHotline[index].phone!),
                    leading: Container(
                      width: 60,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          travelHotline[index].image!,
                          fit: BoxFit.contain,
                          errorBuilder: (c, e, s) =>
                              Icon(Icons.phone, color: Colors.redAccent),
                        ),
                      ),
                    ),
                    title: Text(
                      travelHotline[index].name!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      travelHotline[index].phone!,
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.w500),
                    ),
                    trailing: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(FontAwesomeIcons.phone,
                          color: Colors.green, size: 18),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
