import 'package:bookworms/services/auth_services.dart';
import 'package:bookworms/services/book_services.dart';
import 'package:bookworms/services/friends_services.dart';
import 'package:bookworms/services/profile_services.dart';
import 'package:bookworms/services/router_service.dart';
import 'package:bookworms/services/util.dart';

class ServiceInjector {
  BookServices bookServices = BookServices();
  RouterService router = RouterService();
  AuthServices auth = AuthServices();
  ProfileServices prof = ProfileServices();
  Util util = Util();
  FriendServices friendServices = FriendServices();
}

ServiceInjector si = ServiceInjector();
