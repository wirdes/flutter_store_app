import 'package:flutter_store_app/config.dart';
import 'package:flutter_store_app/models/product.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<List> getProdcut() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.products);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return [];
    }
  }
}
