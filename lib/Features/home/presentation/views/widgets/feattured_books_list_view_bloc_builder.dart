import 'package:clean_arch/Features/home/presentation/manager/featured_books_cubit/fetatured_books_cubit.dart';
import 'package:clean_arch/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeatturedBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return  FeaturedBooksListView(books: state.books,);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
