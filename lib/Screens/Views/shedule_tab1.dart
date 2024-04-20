import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/doctor_details_screen.dart';
import 'package:medical/Screens/Widgets/shedule_card.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class shedule_tab1 extends StatelessWidget {
  const shedule_tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),

          //----------------------------------------------------
          shedule_card(
            confirmation: "Confirmed",
            mainText: "Dr. Mahmoud Atta",
            subText: "Chardiologist",
            date: "26/06/2022",
            time: "10:30 AM",
            image: "assets/icons/male-doctor.png",
          ),

          const SizedBox(
            height: 20,
          ),
          shedule_card(
            confirmation: "Confirmed",
            mainText: "Dr. Ahmed Ragab",
            subText: "Chardiologist",
            date: "26/06/2022",
            time: "2:00 PM",
            image: "assets/icons/female-doctor2.png",
          )
        ],
      ),
    );
  }
}
