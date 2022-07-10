import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../utils/repository/home_repository.dart';
import '../../../../utils/shared_widgets/alert_box.dart';
import '../../../../utils/strings/home_strings.dart';
import '../../entity/product.dart';
import '../../utils/enums.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      :super(HomeState.initial()) {
    on<FetchProducts>(_onFetchProducts);
    on<SetProductsSortBy>(_onSetProductsSortBy);
    on<SetProductsBrandFilter>(_onSetProductsBrandFilter);
    on<SearchProducts>(_onSearchProducts);
    on<AddProductsToCart>(_onAddProductsToCart);
    on<RemoveProductsCart>(_onRemoveProductsCart);
  }
  final HomeRepository _homeRepository = HomeRepository();

  Future<void> _onFetchProducts(
      FetchProducts event,
      Emitter emit,
      ) async {
   try{
      emit(state.copyWith(homeStatus: HomeStatus.loading));
      List<Product>? _products = await _homeRepository.fetchProducts();
      if (_products == null) {
        AlertBox().showError(HomeStrings.noProductsFound);
        emit(state.copyWith(
          productList: [],
          homeStatus: HomeStatus.failure,
        ));
      } else {
        emit(state.copyWith(
            productList: _products,
            filteredProductList:_products,
            searchProductList: _products,
            homeStatus: HomeStatus.success,
            brandFilter: BrandFilter.unknown));
      }
   }
    catch(e){
      AlertBox().showError(HomeStrings.noProductsFound);
    }
  }

  Future<void> _onSetProductsSortBy(
      SetProductsSortBy event,
      Emitter emit,
      ) async {
    emit(state.copyWith(
        productsSortBy:state.productsSortBy== event.productsSortBy?ProductsSortBy.unknown:event.productsSortBy));
  }
  Future<void> _onSetProductsBrandFilter(
      SetProductsBrandFilter event,
      Emitter emit,
      ) async {
    emit(state.copyWith(
        brandFilter:event.brandFilter,homeStatus: HomeStatus.loading));
    List<Product>? listOfProducts = state.productList.toList();
    List<Product> filteredProducts = [];
    listOfProducts.map((e) {
      if (e.name!.toLowerCase().contains(event.brandFilter.name.toLowerCase()) ) {
        filteredProducts.add(e);
      }
      return e;
    }).toList();
    emit(
      state.copyWith(
        homeStatus: HomeStatus.success,
        filteredProductList: filteredProducts.isNotEmpty?filteredProducts:state.productList,
      ),
    );
  }

  Future<void> _onSearchProducts(
      SearchProducts event,
      Emitter emit,
      ) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    List<Product>? listOfProducts = state.productList.toList();
    List<Product> searchedProducts = [];
    listOfProducts.map((e) {
      if (e.name!.toLowerCase().contains(event.searchKeyword) ||
          e.brandName!.toLowerCase().contains(event.searchKeyword) ) {
        searchedProducts.add(e);
      }
      return e;
    }).toList();
    emit(
      state.copyWith(
        homeStatus: HomeStatus.success,
        searchProductList: searchedProducts,
      ),
    );

  }
  Future<void> _onAddProductsToCart(
      AddProductsToCart event,
      Emitter emit,
      ) async {
    List<Product>? cartList = state.cartList.toList();
    double totalPrice=state.totalPrice.toDouble();
    if(!cartList.contains(event.product)){
      cartList.add(event.product);
      totalPrice += double.parse(event.product.price?.amount??"0");
    }
    emit(state.copyWith(cartList: cartList,totalPrice: totalPrice.toInt()));
    AlertBox().showSuccess(HomeStrings.productAddedToCart);
  }
  Future<void> _onRemoveProductsCart(
      RemoveProductsCart event,
      Emitter emit,
      ) async {
    List<Product>? cartList = state.cartList.toList();
    double totalPrice=state.totalPrice.toDouble();
    if(cartList.contains(event.product)) {
      cartList.remove(event.product);
      totalPrice -= double.parse(event.product.price?.amount??"0");
    }
    emit(state.copyWith(cartList: cartList,totalPrice: totalPrice.toInt()));
  }
}
