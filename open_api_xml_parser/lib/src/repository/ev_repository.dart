import 'package:open_api_xml_parser/src/model/ev.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class EvRepository{
  // 공공 데이터의 일반키 api key
  var apiKey = "fYcPKSWjJHGZBbSM%2BR5ukYGA%2FzW2J4Iv0qEMg6wYi9Kdin95NVPlYWjrHSteBiQ86r8g7BxM%2FgTNCuSeW8fcpA%3D%3D";

  Future<List<Ev>?> loadEvs() async {

    var addr = "서울";
    String baseUrl = "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?addr=$addr&pageNo=1&numOfRows=10&ServiceKey=$apiKey";
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200){

      final body = convert.utf8.decode(response.bodyBytes);

      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();

      Map<String, dynamic> jsonResult = convert.json.decode(json);
      final jsonEv = jsonResult['response']['body']['items'];

      // 정상적으로 데이터 불러왔다면
      if(jsonEv['item'] != null){

        List<dynamic> list = jsonEv['item'];

        return list.map<Ev>((item) => Ev.fromJson(item)).toList();
      }
    }
    return null;
  }
}