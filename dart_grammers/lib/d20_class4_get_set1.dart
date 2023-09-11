import 'd20_class4_get_set2.dart';

void main()
{
  var unit1 = Unit();

  // unit._age = 30;
  // unit.age(30);
  unit1.age = 30;
  print(unit1.age);

  // 그냥 변수명을 사용하는 것과 똑같지만
  // 메서드이므로 값으 ㅣ변경이 가능하다.

  // 계단식 표기법 .. 연산자를 통해 연속해서 메서드 호출하기
  var unit2 = Unit()
  ..setName('메딕')
  ..setAge(150);
  print("이름:${unit2.name}, 나이: ${unit2.age}");

  //일반적인 메서드 호출방식
  unit2.setName('커멘드센터');
  unit2.setAge(1000);
  print("이름:${unit2.name}, 나이:${unit2.age}");
}
