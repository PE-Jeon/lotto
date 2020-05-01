randomnumber() {
  var list = new List<int>.generate(44, (int index) => index);
  list.shuffle();
  for (var i=0; i<44; i++) {
    list[i] = 1 + list[i];
  }

  print(list[0]);
  print(list);

  /*  var rng = new Random();
  var list = [1, 1, 1, 1, 1, 1];
  for (var i = 0; i < 6; i++) {
    list[i] = 1 + rng.nextInt(44);
    print(list[i]);
    //print(rng.nextInt(6));
  }*/

  return list;
}

void bubbleSort(List list) {
  if (list == null || list.length == 0) return;

  int n = list.length;
  int i, step;
  for (step = 0; step < 6; step++) {
    for ( i = 0; i < 6 - step - 1; i++) {
      if (list[i] > list[i + 1]) {
        swap(list, i);
      }
    }
  }
}

void swap(List list, int i) {
  int temp = list[i];
  list[i] = list[i+1];
  list[i+1] = temp;
}

void shuffleNo(List list) {
  list.shuffle();
  for (var i = 0; i < 44; i++) {
    list[i] = 1 + list[i];
  }
  //print(list);
  bubbleSort(list);
}