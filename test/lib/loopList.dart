import 'dart:ffi';
import 'dart:math';

void main() {
  List<int> myList = [0,1,2,3];
  bool check = true;

  int num = Random().nextInt(5);
  for (int i = 0; i < myList.length; i++){
    if (myList[i] == num){
      num = Random().nextInt(5);
      i = 0;
    }
  }

  myList.add(num);

  print(myList);
}