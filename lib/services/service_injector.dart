import 'package:bookworms/services/book_services.dart';

class ServiceInjector {
  BookServices bookServices = BookServices();
}

ServiceInjector si = ServiceInjector();
