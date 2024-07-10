## 선언

```dart
String sayHello(String name){
 return "Hello $name, nice to meet you!";
}

//fat arrow syntax 로도 쓸 수 있음. 
//바로 값을 리턴하는 짧은 함수의 경우 한줄로 쓸 수 있기 때문에 간단해짐.
//{}+return 을 => 로 대체하는 것.
String sayHello(String name) => "Hello $name, nice to meet you!";
num plus(num a, num b) => a+b;
void main(){
	print(sayHello('nico'));
}
```
<br><br>
## Named Parameters

여러 값을 한번에 가져오고 싶을 때를 생각해보자. 아래와 같이 선언 후 호출하면, 사용자가 순서를 기억하기도 어려울 뿐더러 각각의 파라미터가 어떤 값을 의미하는지 모를 수 있다.

```dart
//방법 1
String sayHello(String name,int age, String country){
	return "Hello $name, you are $age, and come from $country";
}
void main(){
	sayHello("서연",20,"한국");
}
```
<br><br>
그래서 사용하는 것이 named argument이다. Named argument는 우리가 함수에서 선언한 파라미터에 중괄호 {} 만 추가하면 된다. 매우 간단! 그러면 파라미터 값을 순서 상관없이 입력할 수 있다.
<br><br>

```dart
//방법 2 : named argument
String sayHello({String name,int age, String country}){
	return "Hello $name, you are $age, and come from $country";
}

void main(){
	print(sayHello(
	//순서 상관없이 입력 가능해짐
		age : 12,
		country: ;'cuba',
		name:'nico
	));
}
```
<br><br>
## null-safety of named parameters

그런데 dart는 null safety가 적용되어 있으므로, 만약 사용자가 age 정보만 보내고, country와 name의 정보를 알려주지 않는다면 어떻게 해야 될까?  Null safety를 위해 두가지 방법으로 처리할 수 있다.
<br><br>
- 방법 1 :  함수 선언 시 default 값을 미리 정해준다.

```dart
String sayHello({String name='anton',int age=99, String country='korea',}) {
return "Hello $name, you are $age, and come from $country";
}
```
<br>

- 방법 2 : required modifier를 통해 반드시 해당 변수의 값을 입력하도록 한다.

```dart
String sayHello({
	required String name, 
	required int age, 
	required String country
}) {
	return "Hello $name, you are $age, and come from $country";
}
```
그렇지만 default 값이 아니라 유저에게 실제 데이터를 전부 받아야 한다면?? 
두 번째 방법을 사용해야 한다.

+몇몇 function들은 default value를 주는 것이 불가능할 수 있다. 사용자가 데이터를 전달하지 않으면 동작하지 않는 function들 같은 경우이다. 예를 들어, 사용자가 로그인을 할 때 이메일이나 비밀번호를 default value로 줄 수는 없다. 이런 경우에는 required modifier을 주면 된다.

<br><br>

## Optional Positional Parameters

positional parameter는 우리가 아는 기본적인 파라미터 선언 방법으로, 선언된 순서대로 입력해야 한다. 그러나 만약 일부 파라미터를 사용자가 전달하지 않아도 함수를 호출하고 싶다면, optional 방법을 사용하면 된다. 대괄호와 ?을 통해 null일 수도 있음을 암시하고 default값을 부여하면 된다.

```dart
String sayHello(String name, int age, [String? country = "cuba"]) {
	return 'Hello ${name}, You are ${age} from the ${country}';
}

void main(){
	var result = sayHello("sugar", 10);//country를 입력하지 않고도 sayHello를 불러올 수 있음.
		print(result);
}
```
<br><br>
## QQ operator

물음표가 두개인 연산자이다. 아래에서 이름을 모두 대문자로 바꾸는 함수를 만들었다. 그러나 이름이 null일지도 모르는 값에 toUpperCase 함수를 호출할 수는 없다. 이를 ??연산자를 통해 체크할 수 있다.

left ?? right

left값이 null이면 right를 리턴하고, 아니면 left를 그대로 리턴

```dart
//?? 연산
String capitalizeName(String? name) => name?.toUpperCase() ?? "";
}
```
<br><br>
## QQ equals operator (QQ assignment)

‘??=’ 연산자를 이용하면 변수 안에 값이 null인 경우 지정한 값을 할당해줄 수 있다.

```dart
//QQ equals(QQ assigmnent operator)
void main(){
	String? name;
	name ??= "sugar"; // name이 null이라면 'sugar'를 할당해줘
	name = null;
	name ??= "js";
	print(name); // js
}
```
<br><br>
## Typedef

자료형에 사용자가 원하는 alias를 붙일 수 있게 해준다. (자료형 이름의 별명을 만들 때 사용)

```dart
// List<int> 자료형의 이름을 ListOfInts로 대체
typedef ListOfInts = List<int>; 
ListOfInts reverseListOfNumbers(ListOfInts list) {
	return reversedList = list.reversed.toList();
}

// Maps로 typedef 만들기
typedef UserInfo =Map<String,String>; 
String sayHi(UserInfo userInfo){
	return "Hi ${userInfo['name']}";
}
void main(){
	sayHi({'name':'xeoyeon'});
}

```

<br><br>
