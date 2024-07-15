# Mixins
Mixin은 생성자가 없는 클래스로 `class` 키워드 대신 `mixin`을 사용하여 생성한다. Mixin을 통해 우리는 클래스에 필요한 속성을 가져올 수 있다.
<br><br>

```dart
mixin Strong {
  final double strengthLevel = 1500.99;
}
mixin QuickRunner {
  void runQuick(){
    print("runnnnn!");
  }
}
mixin Tall {
  final double height =1.99;
}

//extends 가 아닌 with를 사용
class Player with Strong, QuickRunner, Tall {}
class Horse with Strong, QuickRunner {}
class Kid with QuickRunner {}

void main(){
  var player = Player();
  player.runQuick(); //runnnnn! 이 출력
}
```
<br>

### `mixin` vs `inheritance`

 부모 클래스에 생성자가 있는 경우, 자식 클래스를 만들 때 `super`를 이용해야 했다. mixin은 `with`로 다른 클래스의 속성과 메소드를 가져오는 것일 뿐, 상속과는 다르다.
핵심은 Mixin은 **여러 클래스에 재사용이 가능하다**는 점이다. 하나의 클래스에 쓸거면 그 클래스 안에서 선언하는 게 빠르다. 
