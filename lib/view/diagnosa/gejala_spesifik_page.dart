import 'dart:convert';

import 'package:flutter/material.dart';

import '../../config/app_color.dart';

class GejalaSpesifikPage extends StatefulWidget {
  const GejalaSpesifikPage({super.key, required this.gejalaSpesifik});
  final dynamic gejalaSpesifik;

  @override
  State<GejalaSpesifikPage> createState() => _GejalaSpesifikPageState();
}

class _GejalaSpesifikPageState extends State<GejalaSpesifikPage> {
  @override
  Widget build(BuildContext context) {
    List gejalaDecode = jsonDecode(widget.gejalaSpesifik);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        title: Text("Gejala Spesifik", style: fontTextStyle.copyWith(fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: gejalaDecode.length,
        itemBuilder: (context, index) {
          var data = gejalaDecode[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.colorPrimaryBlue
            ),
            child: Text(data ?? "", style: fontTextStyle.copyWith(color: AppColor.white),),
          );
      },),
      // body: Container(
      //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      //     padding: const EdgeInsets.all(10),
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(8),
      //       color: AppColor.colorPrimaryBlue
      //     ),
      //     child: Text("${jsonDecode(widget.gejalaSpesifik)}", style: fontTextStyle.copyWith(color: AppColor.white),),
      //   ),
    );
  }
}
