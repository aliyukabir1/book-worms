import 'package:bookworms/services/auth_services.dart';
import 'package:bookworms/services/book_services.dart';
import 'package:bookworms/services/router_service.dart';

class ServiceInjector {
  BookServices bookServices = BookServices();
  RouterService router = RouterService();
  AuthServices auth = AuthServices();
}

ServiceInjector si = ServiceInjector();
