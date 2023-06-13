import 'dart:convert';

import 'package:http/http.dart' as http;

class KoficApi {
  final String API_KEY = "b36905e98360ed4f49ba8603c3c56271";

  // Future<List<dynamic>> getMovieRankingByDt(String dt) async {
  //   String site =
  //       "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=$API_KEY&targetDt=$dt";
  //   var response = await http.get(Uri.parse(site));
  //   if (response.statusCode == 200) {
  //     try {
  //       var movies = jsonDecode(response.body)['boxOfficeResult']
  //           ['boxofficeType'] as List<dynamic>;

  //       print(movies);
  //       return movies;
  //     } catch (e) {
  //       return [];
  //     }
  //   } else {
  //     return [];
  //   }
  // }

  Future<List<dynamic>> search(String dt) async {
    String site =
        'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=5f591c41f4efbb8d272b60244907e9bd&targetDt=$dt';
    print(site);
    var response = await http.get(Uri.parse(site));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var movies =
          //boxOfficeResult.dailyBoxOfficeList
          jsonDecode(response.body)['boxOfficeResult']['dailyBoxOfficeList']
              as List<dynamic>;
      return movies;
    } else {
      return [];
    }
  }

  dynamic getMovieDetailById(String id) async {
    String site =
        "	http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=$API_KEY&movieCd=$id";
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      try {
        var moviesDetail =
            jsonDecode(response.body)['movieInfoResult']['movieInfo'];
        return moviesDetail;
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }
}
