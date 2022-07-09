class APIPaths {
  static const baseUrl = 'https://s3-eu-west-1.amazonaws.com/';

  static String getProductsAPI({required String baseUrl})=>
      baseUrl+'api.themeshplatform.com/products.json';
}
