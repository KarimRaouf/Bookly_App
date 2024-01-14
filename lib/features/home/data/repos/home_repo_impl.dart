import 'package:bookly_application_course/core/errors/failures.dart';
import 'package:bookly_application_course/core/utils/api_service.dart';
import 'package:bookly_application_course/features/home/data/models/book_model.dart';
import 'package:bookly_application_course/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Items>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming');
      BookModel bookModel = BookModel.fromJson(data);
      return right(bookModel.items!);
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturesBooks() {
    // TODO: implement fetchFeaturesBooks
    throw UnimplementedError();
  }
}
