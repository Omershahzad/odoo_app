import 'odoo_response.dart';

class OdooVersion {
  var _version, _server_serie, _protocol_version;
  var _major, _minor, _micro, _release_level, _serial;
  bool _isEnterprise = false;

  String getVersionInfo() {
    return _version;
  }

  int getServerSerie() {
    return _server_serie;
  }

  int getProtocolVersion() {
    return _protocol_version;
  }

  dynamic getMajorVersion() {
    return _major;
  }

  int getMinorVersion() {
    return _minor;
  }

  int getMicroVersion() {
    return _micro;
  }

  String getReleaseLevel() {
    return _release_level;
  }

  String getSerial() {
    return _serial;
  }

  bool isEnterprise() {
    return _isEnterprise;
  }

  OdooVersion parse(OdooResponse response) {
    Map result = response.getResult();
    _version =
        //"13.0+e";
        result['server_version'];
    _server_serie =
        // "13.0";
        result['server_serie'];
    _protocol_version =
        //"1";
        result['protocol_version'];
    List<dynamic> version_info =
        //"13 0 0 final 0 e";
        result['server_version_info'];
    if (version_info.length == 6) {
      _isEnterprise = version_info.last == "e";
    }
    _major =
        //13;
        version_info[0];
    _minor =
        //0;
        version_info[1];
    _micro =
        //0;
        version_info[2];
    _release_level =
        //"final";
        version_info[3];
    _serial =
        // 0;
        version_info[4];
    return this;
  }

  @override
  String toString() {
    if (_version != null) {
      return "${_version} (${_isEnterprise ? 'Enterprise' : 'Community'})";
    }
    return "Not Connected: Please call connect() or getVersionInfo() with callback.";
  }
}
