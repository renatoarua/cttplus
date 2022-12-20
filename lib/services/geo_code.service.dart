import 'package:geocode/geocode.dart';

class GeoCodeService {
  Future<Coordinates> obterCordenadaPeloEndereco(
    String logradouro,
    String numeroResidencia,
    String localidade,
  ) async {
    GeoCode service = GeoCode(apiKey: 'key');

    return await service.forwardGeocoding(
        address: '$logradouro $numeroResidencia, $localidade');
  }
}
