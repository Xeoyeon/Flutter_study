## 클래스 선언 및 생성 방법

- 클래스를 생성할 때에는 `var`가 아닌 정확한 타입을 명시해야 함.
- 또한 아래와 같이 객체를 생성하여 호출할 수 있다. `var player = Player();`
  <br><br>

### `this.name` vs `$name` ?
- sayHello 함수에서 `this.name` 을 사용할 필요 없이 $을 통해(`$name`) name을 호출할 수 있다.
- **this 를 사용하면 현재 객체인 Player를 참조하게 되므로**, 변수와 클래스의 property 이름이 겹치는 경우 클래스의 property를 호출하고 싶다면 this.name을 호출하면 된다.
```dart
class Player{
  String name ='xeoyeon';
  int xp = 1500;
  
  void sayHello(){
    var name ="no";
    print("Hello, my name is $name");
  }
}

void main(){
  //객체 생성
  var player =Player();
  print(player.name);
  player.sayHello();
}
```
출력 결과 : 

![image](https://github.com/user-attachments/assets/5c880e2e-43ed-4a30-975f-750c47bd8333)

<br><br>
## 생성자(Constructors)

argument로 사용자로부터 이름과 xp를 전달받아서 새로운 player를 생성할 수 있게 하는 생성자를 만들고 싶다면 생성자를 새로 선언해주어야 한다.

- 생성자의 이름은 클래스명과 같아야 함.
- late : 변수의 값을 나중에 받아올 것이라고 말해주기.

```dart
class Player {
  //late 를 통해 나중에 값을 받아옴
  late final String name;
  late int xp;

  Player(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }
  void sayHello() {
    print("Hello, my name is $name");
  }
}

void main() {
  //객체 생성
  var player1 = Player("xeoyeon", 1000);
  var player2 = Player("xeo", 1500);
  print(player1.name);
  player2.sayHello();
}
```

late를 쓰지 않고 아래처럼 생성자를 더 간편하게 선언할 수 있다.


```dart
Player(this.name, this.xp);
```
<br><br>
## Named constructors

순서에 상관없이 인자를 받고 싶을 때 이를 사용한다. Player 생성자에 주목! 참고로 positional parameter는 기본적으로 required 속성을 가진다. 즉, 값을 반드시 가져야 한다는 것.

```dart
class Player{
  final String name;
  int xp;
  int age;
  String team;
  
  Player({
    required this.name,
    required this.xp,
    required this.age,
    required this.team,
  });
}

void main(){
  var player = Player(
    name : "xeoyeon",
    xp : 1500,
    age : 14,
    team : "red"
  );
}
```
<br><br>
## Named constructors 2

위에서 배운 기본 생성자와 다르다. 필요에 따라 다른 인자를 받게 하는 생성자를 만들때 사용한다.

![image](https://github.com/user-attachments/assets/060ecfdb-3960-46d2-be81-5b42d71e6c2a)

**콜론(:)**을 통해 해당 클래스를 초기화한다. 이때, 주의할 점은 우리가 받아오는 인자를 제외한 ‘xp’와 'team'이라는 값은 직접 초기화해 주어야 한다.

```dart
class Player{
  final String name;
  int xp;
  int age;
  String team;
  
  Player({
    required this.name,
    required this.xp,
    required this.age,
    required this.team,
  });
  
  //Player에서 'name'과 'age'만 받는 생성자.
  Player.createBluePlayer({required String name, required int age,}) :
  this.age =age,
  this.name = name,
  this.xp =1500,
  this.team = "blue";
}

void main(){
  var player = Player.createBluePlayer(
    name : "xeoyeon",
    age : 14,
  );
}
```

Named constructor 에도 syntatic sugar(편의 문법)이 존재한다.

```dart
//positional parameters
Player.createRed(
	this.name,
	this.age,
	[this.xp= '1500']
);

//named parameters
Player.createBlue({
	required this.name,
	required this.age,
	this.xp = '1500',
});
```

API로 데이터를 받으면, 그걸 클래스로 바꾸어야 한다.

```dart
class Player{
	final string name;
	int xp;
	String team;
	
	Player.fromJson(Map<String,dynamic> playerJson) :
		name= playerJson['name'],
		xp= playerJson['xp'],
		team= playerJson['team'];
}

void main(){
	var apiData =[
		{
			"name" : "xeoyeon",
			"team" : "red",
			"xp" : 500,
		},
		{
			"name" : "dal",
			"team" : "blue",
			"xp" : 0,
		},
		{
			"name" : "lynn",
			"team" : "red",
			"xp" : 400,
		},
	];
	
	apiData.forEach((playerJson) {})
}
```

Cascade Notation
