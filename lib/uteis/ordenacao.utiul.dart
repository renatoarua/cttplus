abstract class OrdenacaoUtiul<T> {
  static const String alphanumericoCrescente = 'crescente';
  static const String alphanumericoDecrescente = 'decrescente';

  static const String campoNome = 'nome';

  List<T> ordernarListaAlphanumerica(
    List<T> lista,
    String ordenacao,
    String campo,
  ) {
    switch (ordenacao) {
      case alphanumericoCrescente:
        lista.sort(<T>(a, b) {
          return a[campo].toLowerCase().compareTo(b[campo].toLowerCase()) as T;
        });
        break;

      case alphanumericoDecrescente:
        lista.sort(<T>(a, b) {
          return b[campo].toLowerCase().compareTo(a[campo].toLowerCase()) as T;
        });
        break;

      default:
    }

    return lista;
  }
}
