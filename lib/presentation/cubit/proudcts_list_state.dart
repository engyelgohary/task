part of 'proudcts_list_cubit.dart';

@immutable
sealed class ProductsListState {}

final class ProductsListInitial extends ProductsListState {}
final class ProductsListLoading extends ProductsListState {}
final class ProductsListError extends ProductsListState {
  final String message;

  ProductsListError(this.message);

  @override
  List<Object> get props => [message];
}
final class ProductsListSuccess extends ProductsListState {
  Data product;

  ProductsListSuccess({required this.product});

  @override
  List<Object> get props => [product];
}

