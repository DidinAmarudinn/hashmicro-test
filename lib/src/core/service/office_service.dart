

import 'package:get_storage/get_storage.dart';
import 'package:hashmicro_test/src/core/data/model/office_location_model.dart';

abstract class OfficeService {
  factory OfficeService() = _OfficeService;
  OfficeLocationModel? getOfficeLocation();
  void setOfficeLocation(OfficeLocationModel office);
  void removeOffice();
}

class _OfficeService implements OfficeService {
  final _key = 'office-key';
  final _storage = GetStorage();

  @override
  OfficeLocationModel? getOfficeLocation() {
    final raw = _storage.read(_key);
    if (raw != null) {
      return OfficeLocationModel.fromJson(raw);
    }
    return null;
  }

  @override
  void removeOffice() {
    _storage.remove(_key);
  }

  @override
  void setOfficeLocation(OfficeLocationModel auth) {
    _storage.write(
      _key,
      auth.toJson(),
    );
  }
}
