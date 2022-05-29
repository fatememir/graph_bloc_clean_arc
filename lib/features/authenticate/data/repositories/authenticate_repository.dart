import 'package:injectable/injectable.dart';
import 'package:jan_with_base/features/authenticate/data/data_source/authenticate_remote_datasource.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/preferences.dart';
import '../model/authenticate_data_model.dart';


@LazySingleton(as: IAuthenticateRepository)
class AuthenticateRepository implements IAuthenticateRepository {
  AuthenticateRepository(
      this._networkInfo, this._remoteDataSource);

  final NetworkInfo _networkInfo;
  final IAuthenticateRemoteDataSource _remoteDataSource;



  @override
  Future< AuthenticateDataModel?> authenticate(String phoneNumber , int code) async {
    if (await _networkInfo.isConnected) {
      print("we are in authenticate repository");
      final models = await _remoteDataSource.authenticate(phoneNumber , code);

      if(models != null){
        PreferenceUtils.shared?.setString("token", models.token!);

        print("data isnt null in auth repository");

        return models;

      }else{
        print("data is null in auth repository");

        return null;
      }

      // await _localDataSource.cacheCharacters(models, page);
    } else {
      print("error in login repository");

      return AuthenticateDataModel(token: "error in auth repository ");

    }
  }

}


abstract class IAuthenticateRepository {
  Future<AuthenticateDataModel?> authenticate(String phoneNumber , int code);
}

