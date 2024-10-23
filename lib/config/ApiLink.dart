class AppLink {
  static String baseURL = "https://tserver.booksica.com/api/v1";

  // static String baseURL = "https://server.booksica.com/api/v1";
  static String getParentCategory =
      '/categoryByParent?id=6593bad7ea5b55c2cd2ee666';

  //Home Api
  static String homeApi = "/get/home/web";

  //All Books
  static String getAllBooks = '/product';

  //get Book by Id
  static String getBookById = '/product';

  //related Product
  static String relatedProdcut = '/related/product';

  //api Link
  static String addToCart = "/cart";

  //get cart
  static String getCart = '/all/cart';

  //get All Address
  static String getAllAddress = '/all/address';

  //update Address
  static String updateAddress = '/address';
}
