part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends HomeEvent {
  const FetchProducts();
}
class SetProductsSortBy extends HomeEvent {
  final ProductsSortBy productsSortBy;
  const SetProductsSortBy(this.productsSortBy);
}
class SetProductsBrandFilter extends HomeEvent {
  final BrandFilter brandFilter;
  const SetProductsBrandFilter(this.brandFilter);
}
class SearchProducts extends HomeEvent {
  final String searchKeyword;
  const SearchProducts(this.searchKeyword);
}
class AddProductsToCart extends HomeEvent {
  final Product product;
  const AddProductsToCart(this.product);
}
class RemoveProductsCart extends HomeEvent {
  final Product product;
  const RemoveProductsCart(this.product);
}