import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  var url = "https://glados.rocks/api/user/checkin";
  // var origin = "https://glados.rocks";
  // var referer = "https://glados.rocks/console/checkin";
  // var useragent =
  //     "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36";

  var cookie = Platform.environment['COOKIE'] ?? 'no cookie';

  var payload = json.encode({'token': 'glados_network'});
  var response = await http.post(Uri.parse(url),
      headers: {
        'content-type': 'application/json;charset=UTF-8',
        'cookie': cookie,
      },
      body: payload);
  // http.post(url, )
  print(response.body);
}
