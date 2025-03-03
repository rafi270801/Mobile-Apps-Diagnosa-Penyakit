import 'package:flutter/material.dart';
import 'package:flutter_diagnosa_penyakit/config/app_color.dart';
import 'package:flutter_diagnosa_penyakit/view/diagnosa/diagnosa_page.dart';
import 'package:flutter_diagnosa_penyakit/view/diagnosa/riwayat_diagnosa.dart';

import '../../config/pref.dart';
import '../../model/users.dart';
import '../../viewmodel/authviewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorPrimaryBlue,
      body: _users == null ? const Center(child: CircularProgressIndicator(),) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset("assets/ic_default_profile.png", width: 60),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang,",
                        style: fontTextStyle.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${_users?.name}",
                        style: fontTextStyle.copyWith(
                            color: const Color(0xFF4F4D4D),
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              height: 1,
              color: AppColor.white,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DiagnosaPage(),));
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/ic_stetoskop.png", width: 36,),
                    Container(
                      margin: const EdgeInsets.only(left: 12, right: 18),
                      color: Colors.grey,
                      width: 1,
                      height: 60,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Diagnosis Sekarang",
                          style: fontTextStyle.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        Text(
                          "Lakukan diagnosis untuk\nmengetahui apakah Anda\nterkena penyakit ....... atau tidak",
                          style: fontTextStyle.copyWith(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RiwayatDiagnosaPage(),));
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Riwayat Diagnosa",
                      style: fontTextStyle.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),

                    Text(
                      "Melihat riwayat diagnosis anda\nyang sudah dilakukan",
                      style: fontTextStyle.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Users? _users;
  getUserProfile() async {
    String? token = await Session().getUserToken();

    if (token != null) {
      AuthViewmodel().userDetail().then((value) {
        if (value.code == 200) {
          setState(() {
            _users = Users.fromJson(value.data);
          });
        }
      });
    }
  }
}
