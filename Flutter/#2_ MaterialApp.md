# MaterialApp
 Material Design을 사용할 수 있게 만들어주는 클래스.
 cf) cupertino- ios design
 <br><br>
## MaterialApp의 속성
1. home:
애플리케이션의 시작 화면을 설정합니다.
```dart
MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text('Home')),
    body: Center(child: Text('Welcome to Flutter!')),
  ),
);
```
 <br><br>
2. initialRoute:
애플리케이션이 시작될 때의 초기 경로를 설정합니다.
```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/second': (context) => SecondPage(),
  },
);
```
 <br><br>
3. routes:
경로와 위젯을 매핑한 맵을 설정합니다. 이를 통해 여러 화면 간의 네비게이션을 관리할 수 있습니다.
```dart
MaterialApp(
  routes: {
    '/': (context) => HomePage(),
    '/second': (context) => SecondPage(),
  },
);
```
 <br><br>
4. onGenerateRoute:
동적으로 라우트를 생성할 때 사용하는 콜백 함수입니다.
```dart
MaterialApp(
  onGenerateRoute: (settings) {
    if (settings.name == '/third') {
      return MaterialPageRoute(builder: (context) => ThirdPage());
    }
    return null;
  },
);
```
 <br><br>
5. onUnknownRoute:
명시되지 않은 경로로 이동할 때 호출되는 콜백 함수입니다.
```dart
MaterialApp(
  onUnknownRoute: (settings) {
    return MaterialPageRoute(builder: (context) => UnknownPage());
  },
);
```
 <br><br>
6. theme:
앱의 전반적인 테마를 설정합니다.
```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
);
```
 <br><br>
7. darkTheme:
다크 모드 테마를 설정합니다.
```dart
MaterialApp(
  darkTheme: ThemeData.dark(),
);
```
<br><br>
8.themeMode:
라이트 모드와 다크 모드 중 어떤 테마를 사용할지 설정합니다.

```dart
MaterialApp(
  theme: ThemeData.light(),
  darkTheme: ThemeData.dark(),
  themeMode: ThemeMode.system, // 시스템 설정에 따라 테마가 변경됩니다.
);
 <br><br>
9. locale:
앱의 기본 지역(locale)을 설정합니다.
```dart
MaterialApp(
  locale: Locale('en', 'US'),
);
```
 <br><br>
10. localizationsDelegates:
앱에서 사용할 지역화 리소스를 설정합니다.
```dart
MaterialApp(
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
);
```
 <br><br>
11. supportedLocales:
앱에서 지원하는 지역의 목록을 설정합니다.
```dart
MaterialApp(
  supportedLocales: [
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ],
);
```
 <br><br>
12. builder:
MaterialApp이 생성하는 위젯 트리의 최상단에 위젯을 추가할 때 사용합니다.
```dart
MaterialApp(
  builder: (context, child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  },
);
```
 <br><br>
13. navigatorKey:
네비게이터의 상태를 전역에서 접근할 수 있도록 설정합니다.
```dart
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

MaterialApp(
  navigatorKey: navigatorKey,
);
```
 <br><br>
