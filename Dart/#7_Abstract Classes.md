# Abstract classes
추상 클래스는 다른 클래스들이 직접 구현해야 하는 메소드들을 모아놓은 것으로, 객체로 생성할 수 없다.
- 함수의 이름과 리턴값, 파라미터만 선언한다.
- 추상 클래스를 사용하고 싶다면, 상속(`extends`)을 이용할 것.
- 추상 클래스는 **특정 메소드를 구현하도록 강제**한다. 상속받은 클래스에서 해당 함수를 구현하지 않으면 에러가 발생하므로, 미연에 구현하지 않은 함수들을 방지하고 확인할 수 있음.

```dart
abstract class Human{
  void walk();
}

enum Team { red, blue }

class Player extends Human{
	String name;
	int xp;
	Team team;
	
  Player({required this.name, required this.xp, required this.team});
  
  void sayHello(){
     print("Hello my name is $name, xp is $xp");
  }
  
  //반드시 walk을 정의해야 함.
  void walk(){
    print('I am walking');
  }
}

void main(){
	var xeoyeon = Player(
    name :'xeoyeon',
    xp: 1200,
    team : Team.red
  )
  ..name ='las'
  ..xp=120000
  ..team= Team.blue; 
  xeoyeon.sayHello();
}
```



