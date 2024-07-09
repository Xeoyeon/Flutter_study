# Null-safety

<br>
프로그램을 개발하다 보면 런타임, 즉 애플리케이션 실행 중 null 참조 에러가 많이 발생하는데, 
null safety는 이 문제를 코드가 실행되기 전 컴파일러가 해당 버그를 잡아준다.

<br><br>
### nullable vs non-nullable
![image](https://github.com/Xeoyeon/Flutter_study/assets/127655800/01d52823-3cdf-4e84-94c1-0e2bd646f396)

Dart에서 모든 자료형은 기본적으로 non-nullable, 즉 null을 허용하지 않는 자료형이다.
하지만 Null 자체는 매우 중요한 자료형 중에 하나이기 때문에, ?을 자료형 뒤에 붙이면 null값을 허용하는 nullable 자료형을 제공한다. 상속관계는 아래와 같다.


![image](https://github.com/Xeoyeon/Flutter_study/assets/127655800/35d611d2-40bf-4249-9c5e-d750d1a45b6f)


null safety를 활성화하면, 변수 타입 뒤에 ?를 붙이는 경우에만 그 변수에 null을 할당할 수 있다. 
이와 반대로, 타입 뒤에 ?가 없는 경우, 그 변수에는 절대 null이 할당될 수 없다.

```dart
void main() {
	String? nico ="nico";
	nico= null;
	// 컴파일러는 이제 nico 가 null 이 될 수도 있다는 것을 앎. 여기서 nico.length를 사용하면 nico 가 null일 수도 있다고 공지함. 
	// 만약 안전하게 null 이 아닐 때 참조하고 싶다면 아래처럼 조건문을 사용.
	if (nico !=null){
		nico.isNotEmpty;
	}
	// 아래처럼 더 간단하게 작성이 가능하다.
	nico?.isNotEmpty;
```


<br><br>
---

<br>

**초기화 과정에서 발생할 수 있는 에러**

Dart에서 null safety가 활성화된 상태에서는 변수를 선언할 때 초기화를 하지 않으면 컴파일 오류가 발생한다. 이는 변수가 null이 될 수 없음을 보장하기 위해서이다.


<br><br>

1. Null Safety가 활성화된 경우
   int 타입의 변수 value를 선언했지만, 초기화하지 않은 경우 -> 컴파일 에러
```
void main() {
  int value; // 초기화를 하지 않음
  
  // 컴파일 오류: 
  // Error: Non-nullable variable 'value' must be assigned before it can be used.
  print(value);
}
```

<br><br>


2. Null Safety가 활성화된 경우 int?를 사용
null safety가 활성화된 경우, 변수를 nullable 타입으로 선언하면 초기화하지 않아도 컴파일 에러 발생 X.
기본 값으로 null이 할당

```
void main() {
  int? value; // 초기화를 하지 않음, 기본 값은 null
  
  // 이 경우 컴파일 오류 없음
  print(value); // null
}
```

<br><br>


3. late를 사용한 지연 초기화
late 사용시 나중에 초기화 가능. 그러나 초기화 전에 접근하면 -> 런타임 에러 발생

```
void main() {
  late int value; // 나중에 초기화할 것을 보장
  
  // 초기화 전에 접근하면 런타임 오류 발생
  // print(value); // Error

  // 변수 초기화
  value = 42;
  
  // 초기화 후 접근 가능
  print(value); // 42
}
```




