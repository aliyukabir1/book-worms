import 'package:bookworms/services/book_services.dart';
import 'package:bookworms/services/local_storage_service.dart';
import 'package:bookworms/services/router_service.dart';

class ServiceInjector {
  BookServices bookServices = BookServices();
  RouterService router = RouterService();
  LocalStorage localStorage = LocalStorage();
}

ServiceInjector si = ServiceInjector();
