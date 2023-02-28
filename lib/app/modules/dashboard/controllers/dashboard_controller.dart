import 'dart:convert';
import 'package:flutter_ujikom/app/data/manga_response.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import '../../../data/entertaimnet_response.dart';
import '../../../data/headline_response.dart';
import '../../../data/sports_response.dart';
import '../../../data/technology_response.dart';
import '../../../utils/api.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  final _getConnect = GetConnect();
  // var mangaresponse = <MangaResponse>[].obs;
  // var isloading = true.obs;

  Future<HeadlineResponse> getHeadline() async {
    final response = await _getConnect.get(BaseUrl.headline);
    return HeadlineResponse.fromJson(jsonDecode(response.body));
  }

  Future<EntertaimentResponse> getEntertaiment() async {
    final response = await _getConnect.get(BaseUrl.entertainment);
    return EntertaimentResponse.fromJson(jsonDecode(response.body));
  }

  Future<SportsResponse> getSports() async {
    final response = await _getConnect.get(BaseUrl.sports);
    return SportsResponse.fromJson(jsonDecode(response.body));
  }

  Future<TechnologyResponse> getTechnology() async {
    final response = await _getConnect.get(BaseUrl.technology);
    return TechnologyResponse.fromJson(jsonDecode(response.body));
  }

  Future<MangaResponse> getManga() async {
    final response = await _getConnect.get(BaseUrl.manga2);
    return MangaResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  // Future<MangaResponse> fetchMangaResponse() async {
  //   final response = await http.get(
  //     Uri.parse('https://komiku-api.fly.dev/api/comic/list?filter=manga'),
  //   );
  //   print(response.request);
  //   if (response.statusCode == 200) {
  //     MangaResponse _mangaresp =
  //         MangaResponse.fromJson(jsonDecode(response.body));
  //     print(response.headers);
  //     mangaresponse.add(MangaResponse(
  //         data: _mangaresp.data,
  //         code: _mangaresp.code,
  //         message: _mangaresp.message,
  //         success: _mangaresp.success
  //         // data2: _projectresp.data2,
  //         ));

  //     isloading.value = true;
  //   } else {
  //     Get.snackbar(
  //       'Error Mising Data',
  //       'server Response : ${response.statusCode}:${response.reasonPhrase}'
  //           .toString(),
  //     );
  //       return _mangaresp;
  //   }
  // }

  final count = 0.obs;
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

  void increment() => count.value++;
}
