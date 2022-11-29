import 'package:http/http.dart' as http;

class GetExhibitionListService {
  final client = http.Client();

  Future<http.Response> getExhibitList() async {
    final response = await client.get(
        Uri.parse('https://my-json-server.typicode.com/Reyst/exhibit_db/list'));

    return response;
  }
}
