import 'package:injectable/injectable.dart';
import 'package:jan_with_base/features/login/data/data_source/login_remote_datasource.dart';
import '../../../../core/network/network_info.dart';
import '../model/login_data_model.dart';



@LazySingleton(as: ILoginRepository)
class LoginRepository implements ILoginRepository {
  LoginRepository(
      this._networkInfo, this._remoteDataSource);

  // final ILoginLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final ILoginRemoteDataSource _remoteDataSource;



  @override
  Future< LoginDataModel?> login(String phoneNumber) async {
    if (await _networkInfo.isConnected) {
      print("we are in repository");
        final models = await _remoteDataSource.login(phoneNumber);
          // final entities = models.map<LoginData>((e) => e.toEntity());
        if(models != null){
          print("data isnt null in repository");
          return models;
        }else{
          print("data is null in repository");

          return null;
        }

        // await _localDataSource.cacheCharacters(models, page);
    } else {
      print("error in login repository");


        return LoginDataModel(message: "error in repository");
      //   final models = _localDataSource.getLastCharacters(page);
      //   final entities = models.map<Character>((e) => e.toEntity()).toList();
      //   return Right(entities);

    }
  }

  }


  abstract class ILoginRepository {
  Future<LoginDataModel?> login(String phoneNumber);
}

