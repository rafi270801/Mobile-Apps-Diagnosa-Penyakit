import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_diagnosa_penyakit/config/app_color.dart';
import 'package:flutter_diagnosa_penyakit/model/diagnosa.dart';
import 'package:flutter_diagnosa_penyakit/model/disease.dart';
import 'package:flutter_diagnosa_penyakit/model/result.dart';
import 'package:flutter_diagnosa_penyakit/model/symptoms.dart';
import 'package:flutter_diagnosa_penyakit/view/diagnosa/gejala_spesifik_page.dart';
import 'package:flutter_diagnosa_penyakit/view/diagnosa/riwayat_diagnosa.dart';
import 'package:flutter_diagnosa_penyakit/viewmodel/diagnosa_viewmodel.dart';

import '../../model/diagnose.dart';
import '../base_page.dart';

class HasilDiagnosaPage extends StatefulWidget {
  const HasilDiagnosaPage({super.key, required this.symptomsId});
  final List<int> symptomsId;

  @override
  State<HasilDiagnosaPage> createState() => _HasilDiagnosaPageState();
}

class _HasilDiagnosaPageState extends State<HasilDiagnosaPage> {
  @override
  void initState() {
    super.initState();
    if (widget.symptomsId.isNotEmpty) {
      postDiagnosa();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorPrimaryBlue,
      body: _diagnosa == null
          ? Center(
              child: Text(
                "Tidak Ada data",
                style:
                    fontTextStyle.copyWith(fontSize: 16, color: AppColor.white),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top + 46),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: _diagnosa?.results?.length,
                      itemBuilder: (context, index) {
                        Result result = _diagnosa!.results![index];
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.white),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "Hasil Diagnosis : ${result.disease?.name ?? ""} dengan persentase ${result.score}",
                                  style: fontTextStyle.copyWith(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  "${result.disease?.description ?? ""}",
                                  style: fontTextStyle.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GejalaSpesifikPage(
                                      gejalaSpesifik: _diagnosa?.results?[0]
                                          .disease
                                          ?.additionSymptoms),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(8)),
                            width: double.infinity,
                            height: 42,
                            child: Center(
                                child: Text(
                              "Gejala Spesifik",
                              style: fontTextStyle.copyWith(
                                  color: AppColor.colorPrimaryBlue,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RiwayatDiagnosaPage(),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(8)),
                            width: double.infinity,
                            height: 42,
                            child: Center(
                                child: Text(
                              "Riwayat Diagnosa",
                              style: fontTextStyle.copyWith(
                                  color: AppColor.colorPrimaryBlue,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 36),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Gejala yang dipilih",
                            style: fontTextStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _diagnosa?.symptoms?.length,
                          itemBuilder: (context, index) {
                            Symptoms? gejala = _diagnosa?.symptoms?[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${gejala?.name ?? ""}",
                                  style: fontTextStyle.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  width: double.infinity,
                                  color: Colors.grey[600],
                                  height: 1,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const BasePage()),
                (Route<dynamic> route) => false);
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(8)),
            width: double.infinity,
            height: 46,
            child: Center(
                child: Text(
              "Ke halaman Home",
              style: fontTextStyle.copyWith(
                  color: AppColor.colorPrimaryBlue,
                  fontWeight: FontWeight.w600),
            )),
          ),
        ),
      ),
    );
  }

  // List<Result> _listDiagnose = [];
  // List<Symptoms> _listSymptoms = [];
  Diagnosa? _diagnosa;
  postDiagnosa() {
    DiagnosaViewmodel().diagnosa(symptomId: widget.symptomsId).then((value) {
      if (value.code == 200) {
        setState(() {
          _diagnosa = Diagnosa.fromJson(value.data);
        });
        // UnmodifiableListView listData = UnmodifiableListView(value.data);
        // setState(() {
        //   _listDiagnose = listData.map((e) => Result.fromJson(e)).toList();
        //   _listSymptoms = listData.map((element) => Symptoms.fromJson(element)).toList();
        // });
      }
    });
  }
}
