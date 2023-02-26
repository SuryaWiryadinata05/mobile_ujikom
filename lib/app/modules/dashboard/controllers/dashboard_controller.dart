import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ujikom/app/data/entertainment_response.dart';
import 'package:ujikom/app/data/headline_response.dart';
import 'package:ujikom/app/data/sports_response.dart';
import 'package:ujikom/app/data/technology_response.dart';
import 'package:ujikom/app/utils/api.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  final _getConnect = GetConnect();

  Future<HeadlineResponse> getHeadline() async {
    final response = await _getConnect.get(BaseUrl.headline);

    return HeadlineResponse.fromJson(jsonDecode(response.body));
  }

  Future<EntertainmentResponse> getEntertainment() async {
    final response = await _getConnect.get(BaseUrl.entertainment);

    return EntertainmentResponse.fromJson(jsonDecode(response.body));
  }

  Future<SportsResponse> getSports() async {
    final response = await _getConnect.get(BaseUrl.sports);

    return SportsResponse.fromJson(jsonDecode(response.body));
  }

  Future<TechnologyResponse> getTechnology() async {
    final response = await _getConnect.get(BaseUrl.technology);

    return TechnologyResponse.fromJson(jsonDecode(response.body));
  }
  // Future gethadline() async {
  //   try {
  //     final response = await http.get(Uri.parse(BaseUrl.headline));
  //     Iterable it = jsonDecode(response.body);
  //     List<HeadlineResponse> headlineresponse =
  //         it.map((e) => HeadlineResponse.fromJson(e)).toList();
  //     return headlineresponse;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
