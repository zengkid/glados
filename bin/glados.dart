import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  var url = 'https://glados.rocks/api/user/checkin';
  // var origin = "https://glados.rocks";
  // var referer = "https://glados.rocks/console/checkin";
  // var useragent =
  //     "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36";

  var cookie = Platform.environment['COOKIE'] ?? 'no cookie';

  var payload = json.encode({'token': 'glados_network'});
  var response = await http.post(Uri.parse(url),
      headers: {
        // ":authority": 'glados.rocks',
        // ":method": 'POST',
        // ":path": '/api/user/checkin',
        // ":scheme": 'https',
        'content-type': 'application/json;charset=UTF-8',
        'cookie': cookie,
        'dnt': '1',
        'origin': 'https://glados.rocks',
        'sec-ch-ua':
            '" Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"',
        'sec-ch-ua-platform': '"Windows"',
        'sec-fetch-mode': 'cors',
        'sec-fetch-site': 'same-origin',
        'user-agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36 Edg/97.0.1072.76',
      },
      body: payload);
  print(response.body);
}
