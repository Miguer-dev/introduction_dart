void main() {
  test();
}

test() {
  String? name = "John";
  if (name case final name?) {
    print(name);
  }
  switch (name) {
    case var name?:
      print(name);
    default:
      print("empty name");
  }
}
