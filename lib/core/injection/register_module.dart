import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import '../utils/preferences.dart';

@module
abstract class RegisterModule {

  @lazySingleton
  InternetConnectionChecker get connectionChecker =>
      InternetConnectionChecker();

  @lazySingleton

  GraphQLClient get gqlClient => GraphQLClient(
        cache: GraphQLCache(),
        link : PreferenceUtils.shared?.getString("token") != null ? authLink.concat(httpLink) : httpLink
      );

  @preResolve
  @lazySingleton
  Future<Box> get openBox async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    return Hive.openBox<String>('jan_db');
  }


  final HttpLink httpLink = HttpLink(
    "https://api.jaanapp.com/",
    defaultHeaders: {
      'Accept': 'application/json'
    },
  );


  final Link authLink = AuthLink(
      getToken: () async {
        PreferenceUtils.shared?.getString("token") ?? "" ;
      } ,
      headerKey: "token"
  );

}
