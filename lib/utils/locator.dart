import 'package:exhibition_task/services/exhibit_loader.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
      .registerSingleton<GetExhibitionListService>(GetExhibitionListService());
}
