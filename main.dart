void main() {
  print(say("Miguel", "Hey there!", " to all of you!"));
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

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';

  if (device case final device?) {
    result = '$result with a $device';
  }
  return result;
}
