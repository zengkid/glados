import 'package:http/http.dart' as http;

import 'package:xpath_selector/xpath_selector.dart';

Future<void> main(List args) async {
  var url = 'https://weread.qnmlgb.tech/onestep?searchtext=406626024';

  var response = await http.get(Uri.parse(url));
  var content = response.body;
  // print(content);

  var results = XPath.html(content)
      .query(
          "//body/div/div[@style^='display']/div/a[@href^='/onestep_submit']")
      .nodes;
  for (var result in results) {
    var link = result.attributes['href'] as String;
    var linkResult =
        await http.get(Uri.parse('https://weread.qnmlgb.tech' + link));
    print(linkResult.body);
  }
}
