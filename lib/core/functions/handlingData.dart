import 'package:testproject/core/class/StatusRecuest.dart';

handlingData(Response) {
  if (Response is StatusRecuest) {
    return Response;
  } else {
    return StatusRecuest.success;
  }
}
