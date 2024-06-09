import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_diagnosa_penyakit/model/disease.dart';
import 'package:flutter_diagnosa_penyakit/model/history_diagnosa.dart';
import 'package:intl/intl.dart';

import '../../config/app_color.dart';
import '../../viewmodel/diagnosa_viewmodel.dart';

class RiwayatDiagnosaPage extends StatefulWidget {
  const RiwayatDiagnosaPage({super.key});

  @override
  State<RiwayatDiagnosaPage> createState() => _RiwayatDiagnosaPageState();
}

class _RiwayatDiagnosaPageState extends State<RiwayatDiagnosaPage> {
  @override
  void initState() {
    getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        title: Text("Riwayat Diagnosa", style: fontTextStyle.copyWith(fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: _listHistory.isEmpty ? Center(child: Text("Tidak ada data", style: fontTextStyle.copyWith(color: AppColor.colorPrimaryBlue, fontWeight: FontWeight.w600, fontSize: 16),),) : ListView.builder(
        shrinkWrap: true,
        itemCount: _listHistory.length,
        itemBuilder: (context, index) {
          HistoryDiagnosa data = _listHistory[index];
          String formattedDate = data.createdAt.isNotEmpty
              ? DateFormat('yyyy-MM-dd').format(DateTime.parse(data.createdAt))
              : '';
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.colorPrimaryBlue
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${data.diseaseData?[0].name}", style: fontTextStyle.copyWith(color: AppColor.white, fontSize: 16, fontWeight: FontWeight.w600),),
                Text("Tgl : $formattedDate", style: fontTextStyle.copyWith(color: AppColor.white, fontSize: 12),),
              ],
            ),
          );
        },),
    );
  }

  List<HistoryDiagnosa> _listHistory = [];
  getHistory(){
    DiagnosaViewmodel().historyDiagnose().then((value) {
      if (value.code == 200) {
        UnmodifiableListView listData = UnmodifiableListView(value.data);
        setState(() {
          _listHistory = listData.map((e) => HistoryDiagnosa.fromJson(e)).toList();
        });
      }
    });
  }
}
