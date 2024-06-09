import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_diagnosa_penyakit/config/app_color.dart';
import 'package:flutter_diagnosa_penyakit/viewmodel/diagnosa_viewmodel.dart';

import '../../model/diagnose.dart';

class HasilDiagnosaPage extends StatefulWidget {
  const HasilDiagnosaPage({super.key, required this.symptomsId });
  final List<int> symptomsId;

  @override
  State<HasilDiagnosaPage> createState() => _HasilDiagnosaPageState();
}

class _HasilDiagnosaPageState extends State<HasilDiagnosaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorPrimaryBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white
              ),
              child: Center(
                child: Column(
                  children: [
                    Text("Hasil Diagnosis", style: fontTextStyle.copyWith(color: AppColor.black, fontWeight: FontWeight.w700, fontSize: 16),),
                    const SizedBox(height: 12),
                    Text("Psikomatis cardiovascular\n(Psikosomatis yang menyerang bagian\n jantung dan pembuluh darah)", style: fontTextStyle.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text("Gejala yang dipilih", style: fontTextStyle.copyWith(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16,),),
                  ),
                  const SizedBox(height: 12),
                  Text("1. Nyeri pada dada", style: fontTextStyle.copyWith(color: Colors.grey, fontWeight: FontWeight.w600),),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    color: Colors.grey[600],
                    height: 1,
                  ),
                  Text("2. Napas Terasa pendek", style: fontTextStyle.copyWith(color: Colors.grey, fontWeight: FontWeight.w600),),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    color: Colors.grey[600],
                    height: 1,
                  ),
                  Text("3. Sesak napas", style: fontTextStyle.copyWith(color: Colors.grey, fontWeight: FontWeight.w600),),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    color: Colors.grey[600],
                    height: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Diagnose> _listDiagnose = [];
  postDiagnosa(){
    DiagnosaViewmodel().diagnosa().then((value) {
      if (value.code == 200) {
        UnmodifiableListView listData = UnmodifiableListView(value.data);
        setState(() {
          _listDiagnose = listData.map((e) => Diagnose.fromJson(e)).toList();
        });
      }
    });
  }
}
