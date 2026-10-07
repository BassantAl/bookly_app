import 'package:clean_arch/Features/home/data/repos/home_repo_impl.dart';
import 'package:clean_arch/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_arch/Features/home/presentation/manager/featured_books_cubit/fetatured_books_cubit.dart';
import 'package:clean_arch/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:clean_arch/core/di/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FetaturedBooksCubit(
              fetchFeaturedBooksUseCase: FetchFeaturedBooksUseCase(
                homeRepo: gitIt.get<HomeRepoImpl>(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => NewestBooksCubit(
              fetchNewestBooksUseCase: FetchNewestBooksUseCase(
                homeRepo: gitIt.get<HomeRepoImpl>(),
              ),
            ),
          ),
        ],
        child: HomeViewBody(),
      ),
    );
  }
}
