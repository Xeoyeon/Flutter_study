
# #1 Variables

변수 선언 방법 2가지

1. var keyword 사용하기 - 메소드 내 지역변수 설정 시 주로 사용
2. 변수의 타입을 직접 지정하기 - 클래스에서 변수나 property 설정 시 주로 사용

```dart
void main() {
	var name = "pizza"; // 방법 1
	String name = "chicken"; // 방법 2
}
```

### **Dynamic**

여러 타입을 가질 수 있는 변수에 사용.

```dart
void main() {
	dynamic name;
	if(name is String){
		name.(여러 String 관련 함수를 사용할 수 있음)
	}
	if (name is int){
		name.(여러 integer 관련 함수를 사용할 수 있음)
	}
```

### **Nullable Variables**

Null safety - 개발자가 null을 참조하지 못하도록 함 → null 참조 시 런타임 에러가 남.

물음표’?’ 를 사용

null safety를 활성화하면, 변수 타입 뒤에 `?`를 붙이는 경우에만 그 변수에 `null`을 할당할 수 있음. 

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

### **Final**

수정이 불가능.

```dart
void main() {
	final name = "pizza";
	name = "ham"; // 수정 불가
}
```

### **Late**

final 이나 var 앞에 붙여줄 수 있음

변수를 선언하는데 그 안에 데이터가 없는 상태를 의미. 변수를 먼저 선언하고 나중에 데이터를 받아(ex. api) 변수에 넣어줄 수 있게 됨.

```dart
void main() {
	late final String name;
	print(name); // name안에 데이터가 없음 -> 런타임 에러.
}
```


### **Const**

complie-time constant를 의미.

final 처럼 수정이 안되지만, 중요한건 해당 변수의 값은 compile-time에 알고 있는 값이어야 함을 의미

```dart
void main() {
	const API = "12121212";
	~~const~~ APT = fetchApi(); // 컴파일 전에 모름. 예를 들어 api 로부터 받아오는 값, 
	//사용자가 입력해야 하는 값이라면 const 가 아닌 final, var 을 사용
	final APT = fetchApi();
}
```
---

### [정리]

- final: 값을 재할당하지 못하는 변수를 만듦

- dynamic type: 어떤 타입의 데이터가 들어올 지 모를 때 사용함

- const: 컴파일 할 때 값을 알고 있는 변수

- final: 런타임 중에 만들어질 수 있는 변수

- late: final, var, String같은 것들 앞에 써줄 수 있는 수식어로서 어떤 데이터가 올 지 모를 때 사용한다.
