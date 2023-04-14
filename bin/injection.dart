import 'package:injection/instances.dart';

class Anything<S> {
  final String name;
  final List<S> values;

  const Anything(this.name, this.values);

  @override
  String toString() => 'Anything(name: $name, values: $values)';
}

class Person {
  final String name;

  const Person(this.name);

  @override
  String toString() => "Person(name: $name)";
}

void main(List<String> arguments) {
  final mario = Person("Mario");
  final capitu = Person("Capitu");
  final julieta = Person("Julieta");

  final anything = Anything("pessoas", [mario, capitu, julieta]);

  Instances.set(mario);
  Instances.set(julieta);
  Instances.set(anything);

  final instance1 = Instances.get<Anything<Person>>();
  final Person instance2 = Instances.get();
  print(instance1);

  print(instance2);

  // Instances.dispose<Person>();

  final Person instance3 = Instances.get();
  print(instance3);
}
