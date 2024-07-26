# Data Fetching
데이터를 api로 부터 받아오는 간단한 연습을 해보자.
아래는 노마드 코더의 웹툰 api링크를 통해 오늘의 웹툰의 정보를 받아오는 과정이다. 

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
      print(response.body);// body에는 서버에서 보낸 데이터가 있다
      return;
    }
    throw Error();
  }
}

```
async 와 await을 통해 비동기 작업을 수행할 수 있다. 이에 대해서는 뒤에서 더 공부해볼 것이다.
