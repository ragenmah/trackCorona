// import 'package:trackcorona/models/country.dart';
import 'package:trackcorona/models/hospital.dart';

class HospitalViewModel {
  Hospital _hospital;
  HospitalViewModel({Hospital hospital}) : _hospital = hospital;

  String get hospitalName {
    return _hospital.name;
  }

  Map<String, dynamic> get location {
    return _hospital.location;
  }

  bool get isfull {
    return _hospital.isFull;
  }

  bool get governmentApproved {
    return _hospital.governmentApproved;
  }

  String get contactPerson {
    return _hospital.contactPerson;
  }

  String get contactPersonNumber {
    return _hospital.contactPersonNumber;
  }

  String get address {
    return _hospital.address;
  }

  String get phone {
    return _hospital.phone;
  }

  String get website {
    return _hospital.website;
  }

  String get email {
    return _hospital.email;
  }

  String get notes {
    return _hospital.notes;
  }

  String get state {
    return _hospital.state;
  }

  String get imageUrl {
    return _hospital.imageUrl;
  }

  Map<String, String> get capacity {
    return _hospital.capacity;
  }
}
