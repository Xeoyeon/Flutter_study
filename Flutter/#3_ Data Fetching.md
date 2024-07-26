# Data Fetching
데이터를 api로 부터 받아오는 간단한 연습을 해보자.
아래는 노마드 코더의 웹툰 api링크를 통해 오늘의 웹툰의 정보를 받아오는 과정이다. 
<br><br>
```dart
import 'package:http/http.dart' as http;

class ApiService {
  final String baseURL = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseURL/$today'); //문자열 url을 Uri 객체로 파싱.
    final response =
        await http.get(url); //get 메소드를 눌러보면 Uri 타입의 url을 매개변수로 전달해줘야 함을 알 수 있음

    if (response.statusCode == 200) {
      print(response.body);// body에는 서버에서 보낸 데이터가 있다. 디버그 콘솔에서 확인가능.
      return;
    }
    throw Error();
  }
}

```
async 와 await을 통해 비동기 작업을 수행할 수 있다. 이에 대해서는 뒤에서 더 공부해볼 것이다.

<br><br>
# jsonDecode
```print(response.body);```를 통해 디버그 콘솔에서 가져온 데이터의 형태를 볼수 있음. {}를 통해 여러 object가 있고, []을 통해 이 객체들이 리스트 형태로 모여있음을 알 수 있다.

<br><br>
body에는 서버에서 보낸 데이터가 있다.body를 클릭해보면 문자열 형태이고, 우리는 jsonDecode를 통해 문자열을 Dart 객체로 변환한다. response.body가 JSON 배열 형태이므로, `jsonDecode(response.body)`는 이 JSON 배열을 Dart의 List<dynamic>으로 변환된다.
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseURL = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseURL/$today');
    final response =
        await http.get(url); 

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);//JSON 문자열을 Dart 객체로 변환
      for (var webtoon in webtoons) {
        print(webtoon);
      }
      return;
    }
    throw Error();
  }
}

```
<br><br>
