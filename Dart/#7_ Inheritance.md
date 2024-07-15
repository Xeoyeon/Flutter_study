# Inheritance
상속할 때, 생성자를 어떻게 선언해야 하는지 알아보자.
<br><br>
Human 클래스를 만들고, 이를 Player가 상속받는다고 해보자.
Human을 상속할 때 속성과 메소드를 가져오게 되므로, 우리는 Human 생성자를 호출하여 name을 설정해주어야 한다.
```dart
class Human {
  final String name;
  Human({required this.name});
  
  void sayHello(){
    print("Hello my name is $name");
  }
}

enum Team { blue, red }

class Player extends Human{
  final Team team;
 
  //Player의 생성자.
  Player({
    required this.team,
    required String name
  }) : super(name : name); //Player 생성자를 통해 온 name은 super생성자로 전달.

}

void main(){
  var player = Player( team : Team.red, name :"xeoyeon" );
  print(player.name);
}
```
`super(name : name);` 로 Player 생성자를 통해 받아온 name을 super 생성자로 전달한다.

<br><br>
# Super
Player의 생성자를 만들 때, Human의 속성인 name도 설정해줘야 한다. name을 Player 생성자를 통해 받아오고 Human으로 전달해줘야 한다.
이때 `super`라는 키워드를 사용한다. super는 확장을 한 부모클래스와 상호작용할 수 있게 한다. 

위에서 사용한 생성자보다도 더 간단히 아래와 같이 표현할 수 있다.
```dart
Player({
  required this.team,
  required super.name,
});
```


<br><br>
# Override
Human에 정의된 sayHello() 메소드가 아니라, 직접 `sayHello()` 메소드를 새롭게 정의하여 사용하고 싶다고 해보자.

**주의** 부모의 메소드를 Human.sayHello 로 가져올 수 없음. super를 통해 가져와야 한다.
```dart
class Human {
  final String name;
  Human({required this.name});
  
  void sayHello(){
    print("Hello my name is $name");
  }
}

enum Team { blue, red }

class Player extends Human{
  final Team team; 
  Player({
    required this.team,
    required String name
  }) : super(name : name);
  
  @override
  void sayHello(){
    super.sayHello();
    print("and I play for ${team.name}");  //Hello my name is xeoyeon and I play for red 가 출력됨
  }

}

void main(){
  var player = Player( team : Team.red, name :"xeoyeon" );
  player.sayHello();
}
```





