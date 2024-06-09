import 'dart:io';
import 'package:flutter/material.dart';

import '../config/endpoint.dart';
import '../config/model/resp.dart';
import '../config/network.dart';
import '../config/pref.dart';

class DiagnosaViewmodel {

  Future<Resp> diagnosa({List<int>? symptomId}) async {
    // String? idUser = await Session().getUserId();
    // int userId = int.parse(idUser ?? "");
    Map<String, dynamic> formdata = {
      "symptoms": symptomId,
    };

    var resp = await Network.postApi(Endpoint.diagnosaUrl, formdata);
    Resp data = Resp.fromJson(resp);
    return data;
  }

  Future<Resp> historyDiagnose() async {
    String? token = await Session().getUserToken();

    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';

    var resp = await Network.getApiWithHeaders(Endpoint.historyDiagnosaUrl, header);
    Resp data = Resp.fromJson(resp);
    return data;
  }

  Future<Resp> symptoms() async {
    var resp = await Network.getApi("api/symptoms");
    Resp data = Resp.fromJson(resp);
    return data;
  }


}