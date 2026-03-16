import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/hotline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCHomeUi extends StatefulWidget {
  const SubCHomeUi({super.key});

  @override
  State<SubCHomeUi> createState() => _SubCHomeUiState();
}

class _SubCHomeUiState extends State<SubCHomeUi> {
  List<Hotline> bankHotline = [
    Hotline(
        name: 'ธนาคารกรุงเทพ', phone: '1333', image: 'assets/images/subc1.png'),
    Hotline(
        name: 'ธนาคารออมสิน', phone: '1115', image: 'assets/images/subc2.png'),
    Hotline(
        name: 'ธนาคารกสิกรไทย',
        phone: '02 888 8888',
        image: 'assets/images/subc3.png'),
    Hotline(
        name: 'ธนาคารกรุงไทย',
        phone: '02 111 1111',
        image: 'assets/images/subc4.png'),
    Hotline(
        name: 'ธนาคารกรุงศรี', phone: '1572', image: 'assets/images/subc5.png'),
    Hotline(
        name: 'ธนาคารทีเอ็มบีธนชาต',
        phone: '1428',
        image: 'assets/images/subc6.png'),
    Hotline(
        name: 'ธนาคารซิตี้แบงก์',
        phone: '1588',
        image: 'assets/images/subc7.png'),
    Hotline(
        name: 'ธนาคารแอลเอชแบงก์',
        phone: '1327',
        image: 'assets/images/subc8.png'),
    Hotline(
        name: 'ธนาคารธอส',
        phone: '02 645 9000',
        image: 'assets/images/subc9.png'),
    Hotline(
        name: 'ธนาคารไทยพาณิชย์',
        phone: '02 777 7777',
        image: 'assets/images/subc10.png'),
    Hotline(
        name: 'ธนาคารเกียรตินาคิน',
        phone: '02 165 5555',
        image: 'assets/images/subc11.png'),
    Hotline(
        name: 'ธนาคารไทยเครดิต',
        phone: '02 697 5454',
        image: 'assets/images/subc12.png'),
    Hotline(
        name: 'ธนาคารยูโอบี',
        phone: '02 285 1555',
        image: 'assets/images/subc13.png'),
    Hotline(
        name: 'ธนาคารทิสโก้',
        phone: '02 633 6000',
        image: 'assets/images/subc14.png'),
    Hotline(
        name: 'ธนาคารอิสลาม',
        phone: '02 204 2766',
        image: 'assets/images/subc15.png'),
    Hotline(
        name: 'ธนาคารซีไอเอ็มบีไทย',
        phone: '02 626 7777',
        image: 'assets/images/subc16.png'),
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
            'สายด่วน\nธนาคาร',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/bank.jpg',
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
              itemCount: bankHotline.length,
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
                    onTap: () => _makePhoneCall(bankHotline[index].phone!),
                    leading: Container(
                      width: 60,
                      height: 55,
                      // decoration: BoxDecoration(
                      //   color: Colors.grey[100],
                      //   borderRadius: BorderRadius.circular(12),
                      // ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          bankHotline[index].image!,
                          fit: BoxFit.contain,
                          errorBuilder: (c, e, s) =>
                              Icon(Icons.phone, color: Colors.redAccent),
                        ),
                      ),
                    ),
                    title: Text(
                      bankHotline[index].name!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      bankHotline[index].phone!,
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
