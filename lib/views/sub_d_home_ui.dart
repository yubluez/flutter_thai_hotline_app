import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/hotline.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubDHomeUi extends StatefulWidget {
  const SubDHomeUi({super.key});

  @override
  State<SubDHomeUi> createState() => _SubDHomeUiState();
}

class _SubDHomeUiState extends State<SubDHomeUi> {
  List<Hotline> utilitiesHotline = [
    Hotline(
        name: 'ไฟฟ้านครหลวง', phone: '1130', image: 'assets/images/subd5.png'),
    Hotline(
        name: 'ไฟฟ้าส่วนภูมิภาค',
        phone: '1129',
        image: 'assets/images/subd6.png'),
    Hotline(
        name: 'ไฟฟ้าฝ่ายผลิต', phone: '1416', image: 'assets/images/subd7.png'),
    Hotline(
        name: 'การประปานครหลวง',
        phone: '1125',
        image: 'assets/images/subd8.png'),
    Hotline(
        name: 'การประปาส่วนภูมิภาค',
        phone: '1662',
        image: 'assets/images/subd9.jpg'),
    Hotline(name: 'TRUE', phone: '1242', image: 'assets/images/subd1.png'),
    Hotline(name: 'DTAC', phone: '1678', image: 'assets/images/subd2.png'),
    Hotline(name: 'AIS', phone: '1175', image: 'assets/images/subd3.png'),
    Hotline(name: 'TOT', phone: '1100', image: 'assets/images/subd4.jpg'),
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
            'สายด่วน\nสาธารณูปโภค',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/utilities.jpg',
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
              itemCount: utilitiesHotline.length,
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
                    onTap: () => _makePhoneCall(utilitiesHotline[index].phone!),
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
                          utilitiesHotline[index].image!,
                          fit: BoxFit.contain,
                          errorBuilder: (c, e, s) =>
                              Icon(Icons.phone, color: Colors.redAccent),
                        ),
                      ),
                    ),
                    title: Text(
                      utilitiesHotline[index].name!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      utilitiesHotline[index].phone!,
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
