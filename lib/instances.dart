class Instances {
  static Type _getType<T>() => T;

  static final store = <String, dynamic>{};

  static void set<B>(B object) {
    final type = _getType<B>().toString();

    if (type == "dynamic") {
      throw Exception("Cannot inject dynamic types");
    }

    store.addAll({type: object});
  }

  static B get<B>() {
    final type = _getType<B>().toString();

    if (type == "dynamic") {
      throw Exception("Cannot get dynamic types");
    }

    final instance = store[type];

    if (instance == null) {
      throw Exception("Type $type do not exists");
    }

    return instance;
  }

  static void dispose<B>() {
    final type = _getType<B>().toString();
    if (type == "dynamic") {
      throw Exception("Cannot dispose dynamic types");
    }

    store.remove(type);
  }

  static void disposeAll() {
    store.clear();
  }
}
