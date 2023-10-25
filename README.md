# Unveiling the Potential of Dart - A Developer's Insight
1. [Introduction](#introduction)
2. [Variables](#variables)
    - [String interpolation](#string-interpolation)
    - [Null safety](#null-safety)
    - [Late](#late)
    - [Final and Const](#final-and-const)
    - [Typedefs](#typedefs)
3. [Collections](#collections)
    - [Records](#records)
    - [Lists](#lists)
    - [Sets](#sets)	
    - [Maps](#maps)		
4. [Functions](#functions)
    - [Parameters](#parameters)
    - [Return](#return)
    - [Main](#main)
    - [Anonymous Functions](#anonymous-functions)
5. [Patterns](#patterns)
    - [Pattern types examples](#patterns-types-examples)
6. [Control Flow](#control-flow)
    - [Loops](#loops)
    - [Branches](#branches)
7. [Error Handling](#error-handling)


------------------
# Introduction

In the vast landscape of programming languages, Dart stands out as a versatile and powerful creation from Google, designed for both development efficiency and execution excellence. Initially known for being the core of Flutter, the popular cross-platform application development framework, Dart has proven itself as a language capable of effectively addressing modern programming challenges.

Dart blends the familiarity of syntax from languages like C++, Java, and JavaScript with unique features that set it apart in today's technological ecosystem. Whether you're an experienced developer seeking a fresh language or an enthusiastic beginner eager to explore new possibilities, Dart deserves your attention.

Key General and Unique Features of Dart:
* Optional and Strong Typing: Dart offers a unique flexibility by allowing optional typing. You can choose to automatically infer types or specify them explicitly, providing both security and code readability.
* Efficient Compilation: Dart can compile to both native code and JavaScript, making it a solid choice for various platforms. This facilitates the development of applications ranging from mobile devices to web browsers.
* Seamless Asynchrony: With built-in support for asynchronous operations, Dart simplifies creating applications that respond quickly to events, enhancing the user experience in high-interaction scenarios.
* Advanced Functional Programming: Dart embraces functional programming by providing first-class functions, lambdas, and an array of data transformation functions, allowing you to write concise and expressive code.
* Modern Web Development: Dart can be used on both the client and server sides, offering a unique consistency in web development technology.
* Effective Package Management: The ease of creating and managing packages in Dart simplifies code reuse and fosters an active community contributing libraries and tools.
* Performance and Optimization: Dart strives to deliver exceptional performance through compile-time and runtime optimizations, making it suitable for speed and efficiency-demanding applications.
* Metaprogramming and Reflection: Dart allows advanced manipulation of code at compile time, enabling the creation of highly customizable libraries and frameworks.
* Flutter Ecosystem: Being the primary language behind the successful Flutter framework, Dart becomes the go-to choice for those wanting to create appealing, high-performance applications across multiple platforms.

In summary, Dart is more than just the language behind Flutter; it's a powerful, flexible tool that adapts to both modern development needs and future challenges. In this document, we will thoroughly explore the features that make Dart a standout contender in the programming world, destined to drive innovation and efficiency in software development.

----------------------
# Variables

You can declare most variables without explicitly specifying their type using var.
```Dart
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var isOpen = true;
var flybyObjects = ['Jupiter', 'Jupiter', 'Uranus', 'Neptune'];
var person = {'name': 'John', 'age': 25};
var fruits = {'apple', 'banana', 'orange'};
```
Another option is to explicitly declare the type that would be inferred:
```Dart
String name = 'Voyager I';
int year = 1977;
double antennaDiameter = 3.7;
bool isOpen = true;
List<String> flybyObjects = ['Jupiter', 'Jupiter', 'Uranus', 'Neptune'];
Map<String, dynamic> person = {'name': 'John', 'age': 25};
Set<String> fruits = {'apple', 'banana', 'orange'};
```

## String interpolation

To put the value of an expression inside a string, use ${expression}. If the expression is an identifier, you can omit the {}.
```Dart
'${3 + 2}'	 	            //5
'${"word".toUpperCase()}'	//WORD
'$myObject'	                //myObject.toString()
```


## Null safety

Null safety prevents an error that results from unintentional access of variables set to null. With null safety, the Dart compiler detects these potential errors at compile time, avoiding a runtime error.
- You can control whether the type allows null, add a ?
- You must initialize variables before using them. Nullable variables default to null, so they are initialized by default.
- You can’t access properties or call methods on an expression with a nullable type.
- ??= assignment operator, which assigns a value to a variable only if that variable is currently null.
- ?? operator, which returns the expression on its left unless that expression’s value is null.

```Dart
String? name  // Nullable type. Can be `null` or string. Defaurl value null
String name1 = 'Hola'   // Non-nullable type. Cannot be `null` but can be string. Initial value 'Hola'

print(name1 ?? 'Hi'); // <-- Prints Hola.
print(name ?? 'Hello'); // <-- Prints Hello.

name ??= 'Hello'; //name = Hello
name1 ??= 'Hi';   //name1 = Hola
```

## Late

If you’re sure that a variable is set before it’s used, but Dart disagrees, you can fix the error by marking the variable as late. Two common cases are top-level variables and instance variables.
```Dart
late String description;

void main() {
  description = 'Feijoada!';
  print(description);
}
```

When you mark a variable as late but initialize it at its declaration, then the initializer runs the first time the variable is used. This can be used for expensive function.
```Dart
//if the temperature variable is never used, then the expensive readThermometer() function is never called:
late String temperature = readThermometer();
```

## Final and Const

Final refers to variables that can only be assigned once after their declaration, while const refers to compile-time constants whose value must be known before execution.
```Dart
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
const bar = 1000000; 
const double atm = 1.01325 * bar;
```
## Typedefs
Is a concise way to refer to a type. Recommended use inline function types instead of typedefs for functions.
```Dart
typedef IntList = List<int>;
IntList il = [1, 2, 3];

typedef ListMapper<X> = Map<X, List<X>>;
ListMapper<String> m2 = {};  // Map<String, List<String>> m2 = {};

typedef Compare<T> = int Function(T a, T b);
Compare<int> => a - b;
```
----------------------
# Collections

## Records
Records are a collection types fixed-sized, heterogeneous, typed and immutable.
```Dart
(String, int) record;
record = ('A string', 123);

({int a, bool b}) record;
record = (a: 123, b: true);

var record = ('first', a: 2, b: true, 'last');
print(record.$1); // 'first'
print(record.a); // 2
print(record.b); // true
print(record.$2); // 'last'
```

## Lists
Lists in Dart are ordered collections of elements. They may contain duplicate elements and can be accessed by their index
```Dart
var list = [1, 2, 3];
List<int> list2 = [4, 5, 6];

list.length // 3
list[0] == 1 // true
list[1] = 1;
```

## Sets
Sets in Dart are unordered collections of unique items.
```Dart
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
Set<String> halogens2 = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

var elements = <String>{}; // Set<String> names = {};
elements.add('fluorine');
elements.addAll(halogens);
elements.length
```

## Maps
Maps in Dart are unordered collections of key-value pairs. Each key in a map is unique and can be used to access its corresponding value.
```Dart
var nobleGases = {  //Map<int, String>
  2: 'helium',
  10: 'neon',
  18: 'argon',
};

var gifts = Map<String, String>(); // new Map<String, String>()
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

gifts['sex'] == null; // true
gifts.length
```

### Spread operators
Spread operators provide a concise way to insert multiple values into a collection. Example to insert all the values of a list into another list.

```Dart
var list = [1, 2, 3];
var list2 = [0, ...list];
var list3 = [0, ...?list]; //avoid exceptions if list is null
```

### Control-flow operators
Collection if and collection for for use in list, map, and set literals. You can use these operators to build collections.

```Dart
var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
var nav = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];

var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
listOfStrings[1] == '#1'; // true
```



----------------------



# Functions

```Dart
bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```
Function still works if you omit the types.
```Dart
isNoble(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```
For functions that contain just one expression, you can use a shorthand syntax. The => expr syntax is a shorthand for { return expr; }.
```Dart
bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
```

Functions can be assigned to variables or passed as arguments to other functions.

## Parameters

When defining a function, use {param1, param2, …} to specify named parameters.If you don’t provide a default value or mark a named parameter as required, their types must be nullable as their default value will be null.
```Dart
/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool? bold, bool? hidden}) {...}
enableFlags(bold: true, hidden: false);

void enableFlags({bool bold = false, bool hidden = false}) {...}
// bold will be true; hidden will be false.
enableFlags(bold: true);

void enableFlags({bool bold = false, required bool hidden}) {...}
// bold will be false; hidden is required.
enableFlags(hidden: true);
```

Wrapping a set of function parameters in [] marks them as optional positional parameters. If you don’t provide a default value, their types must be nullable as their default value will be null.
```Dart
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device case final device?) {
    result = '$result with a $device';
  }
  return result;
}
```

## Return
All functions return a value. If no return value is specified, the statement return null; is implicitly appended to the function body.
To return multiple values in a function, aggregate the values in a record.

```Dart
(String, int) foo() {
  return ('something', 42);
}
```


## Main

The main() function serves as the entrypoint to the app, returns void and has an optional List<String> parameter for arguments.
```Dart
void main() {
  print('Hello, World!');
}

// Run the app like this: dart args.dart 1 test
void main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}
```

## Anonymous Function
It behaves the same as a regular function, but it doesn’t have a name associated with it. Can have zero or more parameters with optional type annotations.
```Dart
const list = ['apples', 'bananas', 'oranges'];
list.map((item) => item.toUpperCase())
    .forEach((item) => print('$item: ${item.length}'));
```

----------------------



# Patterns
A pattern represents the shape of a set of values that it may match against actual values.

Matching: A pattern always tests against a value to determine if the value has the form you expect. In other words, you are checking if the value matches the pattern.

Destructuring: When an object and pattern match, the pattern can then access the object’s data and extract it in parts. In other words, the pattern destructures the object.

```Dart
var numList = [1, 2, 3];
var [a, b, c] = numList; // List pattern [a, b, c] destructures the three elements from numList...
print(a + b + c);  // ...and assigns them to new variables.
```

## Pattern types examples

```Dart
var isPrimary = switch (color) {
  Color.red || Color.yellow || Color.blue => true,
  _ => false
};

var userAccessType = switch((hasAccess, isOwner)){
  (true,true) => 'admin',
  (true,false) => 'user',
  (false,false) => 'denied',
};

var value = switch (char) {
    < 32 => 'control',
    == 32 => 'space',
    > 32 && < 48 => 'punctuation',
    >= 48 && <= 57 => 'digit',
    _ => ''
  };

String? name = "John";
if (name case final name?){
  print(name);
}
switch (name){
  case var name?: 
    print(name);
  default:
    print("empty name");
}
```
----------------------

# Control Flow

## Loops

```Dart
var message = StringBuffer('Dart is fun');
for (var i = 0; i < 5; i++) {
  message.write('!');
}

for (final candidate in candidates) {
  candidate.interview();
}

var collection = [1, 2, 3];
collection.forEach(print); // 1 2 3

while (!isDone()) {
  doSomething();
}

do {
  printLine();
} while (!atEndOfPage());
```
*The use of break and continue is allowed.

## Branches

```Dart
if (isRaining()) {
  you.bringRainCoat();
} else if (isSnowing()) {
  you.wearJacket();
} else {
  car.putTopDown();
}

if (pair case [int x, int y]) return Point(x, y); //If the pattern matches the value

switch (charCode) {
  case slash || star || plus || minus: // Logical-or pattern
    token = operator(charCode);
  case comma || semicolon: // Logical-or pattern
    token = punctuation(charCode);
  case >= digit0 && <= digit9: // Relational and logical-and patterns
    token = number();
  default:
    throw FormatException('Invalid');
}

token = switch (charCode) {
  slash || star || plus || minus => operator(charCode),
  comma || semicolon => punctuation(charCode),
  >= digit0 && <= digit9 => number(),
  _ => throw FormatException('Invalid')
};
```   

--------------------------------
# Error Handling

```Dart
try {
  breedMoreLlamas();
} on OutOfLlamasException {
  // A specific exception
  buyMoreLlamas();
} on Exception catch (e) {
  // Anything else that is an exception
  print('Unknown exception: $e');
} catch (e, s) { 
  // No specified type, handles all
  print('Exception details:\n $e');
  print('Stack trace:\n $s');
} finally {
  // Runs after any matching catch clauses
  cleanLlamaStalls();
}
```



