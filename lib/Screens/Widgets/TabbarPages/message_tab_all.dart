// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medical/Screens/Views/chat_screen.dart';
import 'package:medical/Screens/Views/shedule_tab1.dart';
// import 'package:medical/Screens/Views/shedule_tab2.dart';
// import 'package:medical/Screens/Widgets/TabbarPages/tab1.dart';
// import 'package:medical/Screens/Widgets/TabbarPages/tab2.dart';
// import 'package:medical/Screens/Login-Signup/login.dart';
import 'package:medical/Screens/Widgets/message_all_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class message_tab_all extends StatefulWidget {
  const message_tab_all({Key? key}) : super(key: key);

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<message_tab_all>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Shedule",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
        ),
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/icons/bell.png"),
              )),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => chat_screen()),
              );
            },
            child: card(
              docName: "Dr. Ahmed Ragab",
              count: "2",
              subtext: "I don,t have any headchace...",
              imageAssets: "assets/icons/male-doctor.png",
              time: "10.30",
            ),
          ),

          //=======

          card(
            docName: "Dr. Maria Elena",
            count: "1",
            subtext: "Do you have fever?",
            imageAssets: "assets/icons/docto3.png",
            time: "11.30",
          ),
          card(
            docName: "Dr. Alysa Hana",
            count: "1",
            subtext: "Do you have fever?",
            imageAssets: "assets/icons/doctor2.png",
            time: "1.30",
          ),

          card(
            docName: "Dr. Maria Elena",
            count: "1",
            subtext: "Do you have fever?",
            imageAssets: "assets/icons/docto3.png",
            time: "11.30",
          ),
          card(
            docName: "Dr. Mahmoud Atta",
            count: "10",
            subtext: "Do you have fever?",
            imageAssets: "assets/icons/zk.png",
            time: "1.30",
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////// card
class card extends StatelessWidget {
  String docName;
  String subtext;
  String time;
  String count;
  String imageAssets;
  card({
    required this.docName,
    required this.subtext,
    required this.time,
    required this.count,
    required this.imageAssets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageAssets),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //2
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  docName,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Text(
                  subtext,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Spacer(),

          //3
          Container(
            margin: const EdgeInsets.only(right: 5),
            width: 45,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 10,
                  child: Text(
                    count,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
