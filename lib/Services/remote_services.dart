import 'package:http/http.dart' as http;
import '../Model/post.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse("https://random-data-api.com/api/v2/beers?size=5&response_type=json");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
