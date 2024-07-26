## MyApp의 constructor
main.dart 의 틀을 간단하게 살펴보자

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```
<br><br>

` MyApp({super.key});`
- MyApp 클래스의 생성자
- `super.key`는 부모 클래스인 StatelessWidget의 생성자를 호출하여, key값을 부모 클래스에 전달한다.
<br><br>
## key
- key는 위젯의 고유 식별자로, 부모 클래스에 key를 전달하여 위젯 트리에서 이 객체를 고유하게 식별할 수 있도록 한다.
- 특히 위젯 트리가 재구성될 때(예: 상태가 변경될 때) 중요한 역할을 한다.
<br><br>
## widget tree
Flutter는 위젯 트리를 효율적으로 재구성하기 위해 key 값을 사용한다. 동일한 key를 가진 위젯은 동일한 위젯으로 간주되어, 불필요한 재구성을 방지.
이는 특히 리스트나 복잡한 레이아웃에서 위젯을 추가하거나 제거할 때 유용하다.



