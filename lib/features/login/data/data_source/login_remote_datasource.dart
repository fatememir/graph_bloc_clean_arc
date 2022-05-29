
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/exceptions.dart' as excptn;
import '../../../../core/utils/gql_query.dart';
import '../model/login_data_model.dart';


abstract class ILoginRemoteDataSource {

  Future<LoginDataModel?> login(String phoneNumber);


}

@LazySingleton(as: ILoginRemoteDataSource)
class LoginRemoteDataSource implements ILoginRemoteDataSource {
  LoginRemoteDataSource(this._client);

  final GraphQLClient _client;

  @override
  Future<LoginDataModel?> login(String phoneNumber) async {
    try {
      final result = await _client.query(QueryOptions(
        document: gql(GqlQuery.authenticate),
        variables: {"value": phoneNumber},
      ));
      if (result.data != null) {
        print("data in remote isnt null");
        print("data= "+result.data.toString());
        // print("data22= "+result.data!['authenticate']
        //     .map((e) => LoginModel.fromJson(e)).toString());

           return LoginDataModel(message: result.data?['authenticate']['message']);


      }else{
        print("data in remote is null");


        return null ;
      }

    } on Exception catch (exception) {
      print("data in remote has error");

      print(exception);
      throw excptn.ServerException();
    }
  }

}
