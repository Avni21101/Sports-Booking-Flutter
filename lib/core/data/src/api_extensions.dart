import 'package:sports_booking/core/data/src/api_enum.dart';

extension StatusCodeX on StatusCode {
  bool get isSuccess =>
      value == 200 || value == 201 || value == 202 || value == 203 || value == 204;
}

extension IntX on int {
  StatusCode get getStatusCodeEnum => StatusCode.values.firstWhere(
    (StatusCode element) => element.value == this,
    orElse: () => StatusCode.http000,
  );
}
