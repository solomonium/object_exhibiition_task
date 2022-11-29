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
}
