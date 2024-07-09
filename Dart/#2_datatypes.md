# Data Types

Dart는 거의 모든게 Object이다. 자료형도 객체이고, 함수도 객체.
<br>
```dart
void main() {
	String name = "tom";
	bool isPlay = true;
	int age = 10;
	double money = 52.55;
	num x = 12;// num -double 과 int의 부모클래스.double이거나 integer일 수 있는 경우 사용
	num y = 1.2;
}
```
<br><br>
### Lists

리스트 선언 방법 두가지

```dart
void main() {
	var numbers =[1,2,3,4]; //방법 1
	List<int> numbers =[1,2,3,4]; //방법 2
}
```

<br><br>
### Collection if
dart의 유용한 점은 `collection if`와 `collection for`을 지원하는 것이다.
collection if를 사용하면 `존재할 수도 안할 수도 있는 요소'를 가지고 올 수 있다.

```dart
void main() {
	var giveMeFive = true;
	List<int> numbers =[
		1,
		2,
		3,
		4,
		if(giveMeFive) 5, // 변수 giveMeFive가 true라면5를 추가함.
	];
}
```
<br><br>
### Collection for

컬렉션 리터럴 내에서 반복문을 사용하여 요소를 추가할 수 있다. 

```dart
void main() {
	var oldFriends =['nico','lynn'];
	var newFriends =[
		'lewis',
		'tom',
		'darren',
		for (var friend in oldFriends) "❤️ $friend",
	]
	print(newFriends);
}
// newFriends에서 oldFriends가 추가되었는데, 이때 하트와❤️ 함께 출력
```

```dart
void main() {
  List<int> baseNumbers = [1, 2, 3];

  List<int> numbers = [
    0,
    for (var number in baseNumbers) number * 2,  // 각 요소를 두 배로 하여 추가합니다.
  ];

  print(numbers); // [0, 2, 4, 6]
}
```
<br><br>
### String Interpolation

단순한 변수값을 넣으려면 $ 뒤에 변수이름을 삽입한다.
계산을 실행할 경우 중괄호{}를 추가로 이용할 수 있다.

```dart
void main() {
	var name ='nico';
	var age =10;
	var greeting = 'Hello everyone, my name is $name, and my age is ${age +2}';
	
	print (greeting);
}
```
<br><br>
### Maps

js,ts에서의 object, python에서의 dictionary 같은 것.
key와 value를 연결하는 객체이다. 키와 값 모두 모든 유형의 객체가 될 수 있다. 

```dart
void main() {
// var 임 왜냐, 컴파일러가 대신 자료형을 정하기 때문.
	var player= {
	// Key: Value = <String>:<Object>
	// 즉 value에는 어떤 자료형이든 올 수 있음.
	'name': 'nico',
	'xp': 19.99,
	'superpower': false
};

// Map 생성자를 사용하여 만들 수도 있음. 정확한 자료형 값을 안다면!
	Map<int,bool> player ={
		1: true,
		2: false,
		3: true
	};
	
	Map<List<int>, bool> player={
		[1,2,3,5]: true,
	};
}
```
<br><br>
### Sets

리스트랑 다르게 중괄호를 사용한다.
속한 모든 아이템들이 유니크해야될 때(**중복값이 없어야 할 때**) 사용한다. 
유니크할 필요가 없다면 List를 사용한다.

```dart
void main() {
	var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
}
```

<br><br>
