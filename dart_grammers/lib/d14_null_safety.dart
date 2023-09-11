import 'package:dart_grammers/d03_variable_use.dart';

void main()
{
  // *** Nullable & Non-nullable ***
  int num1 = 5; // null값을
  int? num2 = 2;  // null값을 허용하는 변수. 값이 없으면 null이

  // num1 = null;
  num2 = null;

  // String str1 = null; // error : Non-Nullabe
  String? str2 = null;    // ok : Nullable

  print("1 ========================================");

  // *** Null Safety 규칙*** null 일때 안전하게 사용하기 위해

  // *** Null Safety 규칙*** 많이 나옴

  // Non-Nullabe 변수는 값 대입 없이 사용할 때 error
  // int a1; print(a1) //에러발생
  int? a2; print(a2);

  var a3 = 10;
  var a4 = null;
  var a5;

  print("2=============================================");

  int num3 = 5;
  int? num4;

  num4 = 10;      // 이 줄이 없으면 다음 줄 에러
  num3 = num4;    // 컴파일 전 체크
  num3 = num4!;   // 실행 시 체크,
  // print(num4);

  // ?.?[] ?.. - null aware operator
  // String name; // <-- 값이 대입되지 않고 사용되면 null일 수 있다.
  String? name;

  // Null 이 아닐 대 메서드 실행
  // ?를 제거하면 에러발생됨. 객체가 null인 상태에서는 멤버메서드를 호출 할 수 없기 때문이다.
  name = name?.toLowerCase();

  int val2 =int.tryParse('n42') ?? -1;
  print('val2 =$val2');

  String? name1;

  myFunction(){
    //String text = name1!;
    //그럼 저렇게 에러가 떴을 때는 어떻게 해야하나, 하면 변수 뒤에 '!'을 붙여주면 됩니다.
    // 그려면 플러터는 '아 저 변수는 사용되는 시점에서 null값이 절대 아니구나 '하고 에러를
    // 없애줍니다
    String text = name1!;
    print(text);
  }
}