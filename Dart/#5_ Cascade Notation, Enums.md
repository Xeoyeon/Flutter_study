## Cascade Notation
cascade operator(..)는 동일한 객체에 대해 여러 메서드 호출이나 속성 설정을 간단하게 해줄 수 있게 돕는다. 이를 통해 코드가 더 간결해지고, 객체를 여러 번 참조할 필요 없이 한번에 수행할 수 있다.

```dart
class Player{
	String name;
	int xp;
	String team;
	
  Player({required this.name, required this.xp, required this.team});
  
  void sayHello(){
     print("Hello my name is $name, xp is $xp");
  }
}

  //xeoyeon.name ='las'; xeoyeon.xp=120000;xeoyeon.team='blue';와 같음.
void main(){
	var xeoyeon = Player(
    name :'xeoyeon',
    xp: 1200,
    team : 'red'
  )
  ..name ='las'
  ..xp=120000
  ..team='blue';
  xeoyeon.sayHello();
}
```
<br><br>

## Enums
관련된 상수 값들을 그룹으로 묶어 표현할 수 있는 방법이다. 코딩 시 오타가 발생할 수 있는데, 이를 잡아주는 역할을 함.
Flutter의 색상등 다양한 곳에서 적용할 수 있음.

``` dart
enum Team { red, blue }

class Player{
	String name;
	int xp;
	Team team; //String이 아닌 Team으로 선언
	
  Player({required this.name, required this.xp, required this.team});
  
  void sayHello(){
     print("Hello my name is $name, xp is $xp");
  }
}

void main(){
	var xeoyeon = Player(
    name :'xeoyeon',
    xp: 1200,
    team : Team.red //'red'라고 쓰면 해당 문자열이 파라미터에 할당 될 수 없다는 에러가 뜸. 
  )
  ..name ='las'
  ..xp=120000
  ..team= Team.blue; //마찬가지.
  xeoyeon.sayHello();
}
```
<br><br>
