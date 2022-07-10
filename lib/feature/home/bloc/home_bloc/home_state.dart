part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure,unknown }

extension HomeStatusExt on String {
  HomeStatus toHomeStatus() {
    return HomeStatus.values.firstWhere(
            (value) => this == value.name,
        orElse: () => HomeStatus.unknown
    );
  }
}

class HomeState extends Equatable
{
  const HomeState({
    required this.homeStatus,
    required this.productList,
    required this.searchProductList,
    required this.filteredProductList,
    required this.cartList,
    required this.brandFilter,
    required this.productsSortBy,
    required this.searchKeyWord,
    required this.totalPrice,
  });
  final HomeStatus homeStatus;
  final List<Product> productList;
  final List<Product> searchProductList;
  final List<Product> filteredProductList;
  final List<Product> cartList;
  final BrandFilter brandFilter;
  final ProductsSortBy productsSortBy;
  final String searchKeyWord;
  final int totalPrice;

  factory HomeState.initial() {
    return const HomeState(
        homeStatus: HomeStatus.initial,
        productList:[],
        searchProductList: [],
      filteredProductList:[],
      cartList:[],
        brandFilter:BrandFilter.unknown,
        productsSortBy: ProductsSortBy.unknown,
      searchKeyWord: '',
        totalPrice:0
    );
  }

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<Product>? productList,
    List<Product>? searchProductList,
    List<Product>? filteredProductList,
    List<Product>? cartList,
    BrandFilter? brandFilter,
    ProductsSortBy? productsSortBy,
    String? searchKeyWord,
    int? totalPrice,

  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
        productList: productList ?? this.productList,
        searchProductList:searchProductList?? this.searchProductList,
      filteredProductList:filteredProductList?? this.filteredProductList,
      cartList:cartList??this.cartList,
        brandFilter: brandFilter?? this.brandFilter,
        productsSortBy:productsSortBy?? this.productsSortBy,
        searchKeyWord: searchKeyWord?? this.searchKeyWord,
        totalPrice:totalPrice?? this.totalPrice
    );
  }

  @override
  List<Object?> get props => [
    homeStatus,
    productList,
    searchProductList,
    cartList,
    filteredProductList,
    brandFilter,
    productsSortBy,
    searchKeyWord,
    totalPrice
  ];

  @override
  String toString() {
    return ''' ''';
  }
}
