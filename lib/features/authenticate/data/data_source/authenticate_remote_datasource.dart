import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:jan_with_base/features/authenticate/data/model/authenticate_data_model.dart';
import '../../../../../core/error/exceptions.dart' as excptn;
import '../../../../core/utils/gql_query.dart';

abstract class IAuthenticateRemoteDataSource {

  Future<AuthenticateDataModel?> authenticate(String phoneNumber , int code);

}

@LazySingleton(as: IAuthenticateRemoteDataSource)
class AuthenticateRemoteDataSource implements IAuthenticateRemoteDataSource {
  AuthenticateRemoteDataSource(this._client);

  final GraphQLClient _client;

  @override
  Future<AuthenticateDataModel?> authenticate(String phoneNumber , int code) async {
    try {
      final result = await _client.query(QueryOptions(
        document: gql(GqlQuery.verify),
        variables: {"value": phoneNumber ,
        "code":code},
      ));
      if (result.data != null) {
        print("data in remote auth isnt null");
        print("data= "+result.data.toString());
        // print("data22= "+result.data!['authenticate']
        //     .map((e) => LoginModel.fromJson(e)).toString());

        return AuthenticateDataModel(token: result.data?['verify']['token']);


      }else{
        print("data in remote auth is null");
        print("data in remote auth is null= "+result.toString());


        return null ;
      }

    } on Exception catch (exception) {
      print("data in remote auth has error");

      print(exception);
      throw excptn.ServerException();
    }
  }

}
