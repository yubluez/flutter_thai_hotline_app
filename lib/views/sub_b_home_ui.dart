import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/hotline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBHomeUi extends StatefulWidget {
  const SubBHomeUi({super.key});

  @override
  State<SubBHomeUi> createState() => _SubBHomeUiState();
}

class _SubBHomeUiState extends State<SubBHomeUi> {
  List<Hotline> emergencyHotline = [
    Hotline(
        name: 'เหตุด่วนเหตุร้าย',
        phone: '191',
        image: 'assets/images/subb1.jpg'),
    Hotline(
        name: 'แจ้งไฟไหม้ สัตว์เข้าบ้าน',
        phone: '199',
        image: 'assets/images/subb2.png'),
    Hotline(
        name: 'สายด่วนรถหาย\n(ตำรวจแห่งชาติ)',
        phone: '1992',
        image: 'assets/images/subb1.jpg'),
    Hotline(
        name: 'อุบัติเหตุทางน้ำ',
        phone: '1196',
        image: 'assets/images/subb4.jpg'),
    Hotline(name: 'แจ้งคนหาย', phone: '1300', image: 'assets/images/subb5.png'),
    Hotline(
        name: 'ศูนย์ปลอดภัยคมนาคม',
        phone: '1356',
        image: 'assets/images/subb6.png'),
    Hotline(
        name: 'หน่วยแพทย์กู้ชีพ',
        phone: '1554',
        image: 'assets/images/subb7.jpg'),
    Hotline(
        name: 'ศูนย์เอราวัณ', phone: '1646', image: 'assets/images/subb8.png'),
    Hotline(
        name: 'เจ็บป่วยฉุกเฉิน',
        phone: '1669',
        image: 'assets/images/subb9.jpg'),
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
            'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/emergency.jpg',
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
              itemCount: emergencyHotline.length,
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
                    onTap: () => _makePhoneCall(emergencyHotline[index].phone!),
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
                          emergencyHotline[index].image!,
                          fit: BoxFit.contain,
                          errorBuilder: (c, e, s) =>
                              Icon(Icons.phone, color: Colors.redAccent),
                        ),
                      ),
                    ),
                    title: Text(
                      emergencyHotline[index].name!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      emergencyHotline[index].phone!,
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
