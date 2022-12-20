// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

abstract class GenericoRepository<T> {
  late Storage storage;
  late String storageName;

  GenericoRepository(String storageName) {
    storage = window.localStorage;
    storageName = storageName;
  }

  Future salvar(T object) async {
    storage[storageName] = object.toString();
  }

  Future<T> obter() async {
    return storage[storageName] as T;
  }

  Future remover() async {
    storage.remove(storageName);
  }
}
