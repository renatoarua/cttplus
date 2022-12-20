import '../models/contato.model.dart';
import 'generico.repository.dart';

class ContatoRepository
    extends GenericoRepository<List<ContatoModel>> {
  ContatoRepository() : super('contatos');
}
