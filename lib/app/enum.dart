/// Used as key in **auth_service.dart** file as key for Hive Storage in getting
/// and setting the userdata
enum HiveKeys {
  userData('data'),
  userToken('token');

  const HiveKeys(this.value);

  final String value;
}
