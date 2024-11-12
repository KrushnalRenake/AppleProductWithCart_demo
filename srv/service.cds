using { appleCart } from '../db/schema.cds';

service appleCartSrv {
  @odata.draft.enabled
  entity AppleProducts as projection on appleCart.AppleProducts;
  entity ShoppingCarts as projection on appleCart.ShoppingCarts;
}