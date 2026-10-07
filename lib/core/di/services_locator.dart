import 'package:clean_arch/Features/home/data/data_sources/home_local_data_source_impl.dart';
import 'package:clean_arch/Features/home/data/data_sources/home_remote_data_source_impl.dart';
import 'package:clean_arch/Features/home/data/repos/home_repo_impl.dart';
import 'package:clean_arch/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arch/core/utils/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final gitIt = GetIt.instance;

void setUp() {
  gitIt.registerSingleton<ApiServices>(ApiServices(dio: Dio()));
  gitIt.registerSingleton<HomeLocalDataSourceImpl>(HomeLocalDataSourceImpl());
  gitIt.registerSingleton<HomeRemoteDataSourceImpl>(
    HomeRemoteDataSourceImpl(apiServices: gitIt.get<ApiServices>()),
  );
  gitIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      homeLocalDataSource: gitIt.get<HomeLocalDataSourceImpl>(),
      homeRemoteDataSource: gitIt.get<HomeRemoteDataSourceImpl>(),
    ),
  );
}
