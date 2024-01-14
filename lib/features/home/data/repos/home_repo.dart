import 'package:bookly_application_course/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Items>>> fetchNewestBooks();

  Future<Either<Failure, List<BookModel>>>  fetchFeaturesBooks();
}
