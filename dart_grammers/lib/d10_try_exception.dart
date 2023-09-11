void main()
{
  int x = 12;
  int y = 0;
  int res1;
  double res2;

  // on은 exception 객체가 필요 없을 때
  try{
    res1 = x~/ y;
  }
  on UnsupportedError{
    print('Cannot divide by zero-0으로 나눌수 없어요');
  }

  try{
    res2 = x / y;
  }
  on UnsupportedError catch(e){
    print(e);
  }

  try{
    res2 = x / y;
  }
  catch(e){
    print(e);
  }

  divide(x, y); // 예외가 처리되지 않으므로 실행이 중지됨
}

divide(int a, int b)
{
  if(b == 0){
    // 예외가 발생하면 호출한 지점으로 예외객체를 던진다. new 생략해도 됨.
    // 강조의 의미이기도 함.
    throw new Exception('cannot divide by zero');
  }
  return a / b;
}
