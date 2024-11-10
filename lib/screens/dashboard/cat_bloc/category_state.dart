part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

 class CategoryInitialSate extends CategoryState {}
class CategoryLoadingSate extends CategoryState {}
class CategoryLoadedSate extends CategoryState {
  List<CategoryModel> mCategories;
  CategoryLoadedSate({required this.mCategories});

}
class CategoryErrorSate extends CategoryState {
  String errorMsg;
  CategoryErrorSate({required this.errorMsg});
}
