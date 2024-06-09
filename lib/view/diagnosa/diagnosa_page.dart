import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_diagnosa_penyakit/model/symptoms.dart';
import 'package:flutter_diagnosa_penyakit/view/diagnosa/hasil_diagnosa_page.dart';

import '../../config/app_color.dart';
import '../../viewmodel/diagnosa_viewmodel.dart';

class DiagnosaPage extends StatefulWidget {
  const DiagnosaPage({super.key});

  @override
  State<DiagnosaPage> createState() => _DiagnosaPageState();
}

class _DiagnosaPageState extends State<DiagnosaPage> {
  bool case1 = false, case2 = false, case3 = false, case4 = false, enableButton = false;
  String _selectedOption = 'Ya';
  Map<int, String> selectedOptions = {};
  int currentQuestionIndex = 0;
  List<int> symptomsId = [];

  @override
  void initState() {
    getSymptoms();
    super.initState();
  }

  void _nextQuestion() {
    if (currentQuestionIndex < _listSymptoms.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _handleRadioValueChange(int questionId, String value) {
    setState(() {
      selectedOptions[questionId] = value;
      if (value == 'Ya') {
        symptomsId.add(questionId);
      } else {
        symptomsId.remove(questionId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        title: Text("Diagnosa", style: fontTextStyle.copyWith(fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          if (currentQuestionIndex > 0){
            _previousQuestion();
          } else {
            Navigator.pop(context);
          }
        }, icon: const Icon(Icons.arrow_back_ios, color: AppColor.black,)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                // "1/${_listQuestion.length}",
                _listSymptoms.isEmpty ? "" : "${currentQuestionIndex+1}/${_listSymptoms.length}",
                style: fontTextStyle.copyWith(
                  color: const Color(0xFF4F5E71),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _listSymptoms.isEmpty ? const Center(child: CircularProgressIndicator(),) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.colorPrimaryBlue
              ),
              child: Center(
                child: Text("Apakah anda ada gejala ${_listSymptoms[currentQuestionIndex].name}", style: fontTextStyle.copyWith(color: AppColor.white, fontWeight: FontWeight.w600, fontSize: 13),),
              ),
            ),
            const SizedBox(height: 20),
            RadioListTile<String>(
              activeColor: AppColor.colorPrimaryBlue,
              title: Text('Ya', style: fontTextStyle,),
              value: 'Ya',
              groupValue: _selectedOption,
              // onChanged: (value) {
              //   setState(() {
              //     _selectedOption = value!;
              //   });
              // },
              onChanged: (value) {
                _handleRadioValueChange(_listSymptoms[currentQuestionIndex].id, value!);
              },
            ),
            RadioListTile<String>(
              activeColor: AppColor.colorPrimaryBlue,
              title: Text('Tidak', style: fontTextStyle,),
              value: 'Tidak',
              groupValue: _selectedOption,
              // onChanged: (value) {
              //   setState(() {
              //     _selectedOption = value!;
              //   });
              // },
              onChanged: (value) {
                _handleRadioValueChange(_listSymptoms[currentQuestionIndex].id, value!);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        child: InkWell(
          onTap: (){
            if (currentQuestionIndex < _listSymptoms.length - 1){
              _nextQuestion();
            } else if (currentQuestionIndex == _listSymptoms.length - 1) {
              debugPrint('Selected IDs for Yes: $symptomsId');
              Navigator.push(context, MaterialPageRoute(builder: (context) => HasilDiagnosaPage(symptomsId: symptomsId),));
            }

          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.colorPrimaryBlue,
              borderRadius: BorderRadius.circular(8)
            ),
            width: double.infinity,
            height: 46,
            child: Center(child: Text(currentQuestionIndex < _listSymptoms.length - 1 ? "Selanjutnya" : currentQuestionIndex == _listSymptoms.length - 1 ? "Tampilkan hasil diagnosis" : "", style: fontTextStyle.copyWith(color: AppColor.white, fontWeight: FontWeight.w600),)),
          ),
        ),
      ),
    );
  }

  List<Symptoms> _listSymptoms = [];
  getSymptoms(){
    DiagnosaViewmodel().symptoms().then((value) {
      if (value.code == 200) {
        UnmodifiableListView listData = UnmodifiableListView(value.data);
        setState(() {
          _listSymptoms = listData.map((e) => Symptoms.fromJson(e)).toList();
        });
      }
    });
  }
}
