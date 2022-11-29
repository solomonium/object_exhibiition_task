// Future<List<Exhibit>> getExhibitList()

import 'dart:convert';

import 'package:exhibition_task/services/exhibit_loader.dart';

import '../model/exhibit_model.dart';
import 'baseview_model.dart';

class ExhibitionModel extends BaseViewModel {
  final GetExhibitionListService getExhibitionListService =
      GetExhibitionListService();
  List<Exhibit>? exhibit;

  Future<List<Exhibit>> getExhibitList() async {
    final response = await getExhibitionListService.getExhibitList();

    exhibit = (json.decode(response.body) as List)
        .map((i) => Exhibit.fromJson(i))
        .toList();

    notifyListeners();
    return exhibit!;
  }

  Future<dynamic> getExhibitListFuture() async {
    final response = await getExhibitionListService.getExhibitList();

    final jsonResponse = json.decode(response.body);

    notifyListeners();
    return jsonResponse;
  }
}

  // Future<List> getExhibitList() async {
  //   try {
  //     log('Retrieving photos - remote data...');
  //     // final res = await ApiRequest.get(photoPointer);
  //     final response = await getExhibitionListService.getExhibitList();
  //     // List jsonResponse = json.decode(response.body);
  //     return exhibitResponseFromMap(response.body);
  //   } catch (e) {
  //     log('Error fetching data...');
  //     rethrow;
  //   }
  // }