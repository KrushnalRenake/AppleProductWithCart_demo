using { sap.common.CodeList } from '@sap/cds/common';

namespace appleCart;

entity AppleProductsAvailabilityCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(50);
  criticality : Integer;
}

entity AppleProducts {
  key ID: UUID;
  productID: String(50) @assert.unique @mandatory;
  name: String(100);
  price: Decimal;
  description: String(255);
  availability: Association to AppleProductsAvailabilityCodeList;
  ShoppingCarts: Association to many ShoppingCarts on ShoppingCarts.appleProducts = $self;
}

entity ShoppingCarts {
  key ID: UUID;
  cartID: String(50) @assert.unique @mandatory;
  productList: String(255);
  totalPrice: Decimal;
  quantity: Integer;
  appleProducts: Association to AppleProducts;
}
