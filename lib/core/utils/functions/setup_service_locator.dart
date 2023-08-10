import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_bookly_clean_architecture/core/utils/api_services.dart';
import 'package:my_bookly_clean_architecture/features/home/data/data_sources/home_local_data_source.dart';
import 'package:my_bookly_clean_architecture/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:my_bookly_clean_architecture/features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImp(),
      homeRemoteDataSource: HomeRemoteDataSourceImp(
        getIt.get<ApiServices>(),
      ),
    ),
  );
}
