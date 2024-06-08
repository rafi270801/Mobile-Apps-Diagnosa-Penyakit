import 'package:flutter/material.dart';
import 'package:flutter_diagnosa_penyakit/view/diagnosa/hasil_diagnosa_page.dart';

import '../../config/app_color.dart';

class DiagnosaPage extends StatefulWidget {
  const DiagnosaPage({super.key});

  @override
  State<DiagnosaPage> createState() => _DiagnosaPageState();
}

class _DiagnosaPageState extends State<DiagnosaPage> {
  bool case1 = false, case2 = false, case3 = false, case4 = false, enableButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.colorPrimaryBlue
              ),
              child: Center(
                child: Text("Silahkan untuk memilih gejala anda alami", style: fontTextStyle.copyWith(color: AppColor.white, fontWeight: FontWeight.w700),),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: (){
                setState(() {
                  case1 = !case1;
                  enableButton = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: case1 ? AppColor.colorPrimaryBlue : Colors.grey,
                    width: case1 ? 3 : 2
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nyeri pada dada", style: fontTextStyle.copyWith(color: Colors.grey, fontWeight: FontWeight.w600),),
                    case1 ? Image.asset("assets/ic_checklist_active.png", width: 30) : Image.asset("assets/ic_checklist.png", width: 30)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: (){
                setState(() {
                  case2 = !case2;
                  enableButton = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: case2 ? AppColor.colorPrimaryBlue : Colors.grey,
                        width: case2 ? 3 : 2
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sukar untuk tidur", style: fontTextStyle.copyWith(color: Colors.grey, fontWeight: FontWeight.w600),),
                    case2 ? Image.asset("assets/ic_checklist_active.png", width: 30) : Image.asset("assets/ic_checklist.png", width: 30)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: (){
                setState(() {
                  case3 = !case3;
                  enableButton = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: case3 ? AppColor.colorPrimaryBlue : Colors.grey,
                        width: case3 ? 3 : 2
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Napas terasa pendek", style: fontTextStyle.copyWith(color: Colors.grey, fontWeight: FontWeight.w600),),
                    case3 ? Image.asset("assets/ic_checklist_active.png", width: 30) : Image.asset("assets/ic_checklist.png", width: 30)

                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: (){
                setState(() {
                  case4 = !case4;
                  enableButton = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: case4 ? AppColor.colorPrimaryBlue : Colors.grey,
                        width: case4 ? 3 : 2
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sesak napas", style: fontTextStyle.copyWith(color: Colors.grey, fontWeight: FontWeight.w600),),
                    case4 ? Image.asset("assets/ic_checklist_active.png", width: 30) : Image.asset("assets/ic_checklist.png", width: 30)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        child: InkWell(
          onTap: (){
            if (case1 || case2 || case3 || case4){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HasilDiagnosaPage(),));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: case1 == true || case2 == true || case3 == true || case4 == true ? AppColor.colorPrimaryBlue : Colors.grey,
              borderRadius: BorderRadius.circular(8)
            ),
            width: double.infinity,
            height: 42,
            child: Center(child: Text("Tampilkan hasil diagnosis", style: fontTextStyle.copyWith(color: AppColor.white, fontWeight: FontWeight.w600),)),
          ),
        ),
      ),
    );
  }
}
