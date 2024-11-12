using { appleCartSrv } from '../../srv/service.cds';

annotate appleCartSrv.AppleProducts with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate appleCartSrv.AppleProducts with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate appleCartSrv.AppleProducts with @UI.DataPoint #availability: {
  Value: availability_code,
  Title: 'Availability',
  Criticality: availability.criticality,
};
annotate appleCartSrv.AppleProducts with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name', ID: 'Name' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price', ID: 'Price' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#availability', ID: 'Availability' }
];
annotate appleCartSrv.AppleProducts with @UI.HeaderInfo: {
  TypeName: 'Apple Product',
  TypeNamePlural: 'Apple Products',
  Title: { Value: productID }
};
annotate appleCartSrv.AppleProducts with {
  ID @UI.Hidden
};
annotate appleCartSrv.AppleProducts with @UI.Identification: [{ Value: productID }];
annotate appleCartSrv.AppleProducts with {
  productID @Common.Label: 'Product ID';
  name @Common.Label: 'Name';
  price @Common.Label: 'Price';
  description @Common.Label: 'Description';
  availability @Common.Label: 'Availability';
  ShoppingCarts @Common.Label: 'Shopping Carts'
};
annotate appleCartSrv.AppleProducts with {
  ID @Common.Text: { $value: productID, ![@UI.TextArrangement]: #TextOnly };
  availability @Common.Text : { $value: availability.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate appleCartSrv.AppleProducts with {
  availability @Common.ValueListWithFixedValues;
};
annotate appleCartSrv.AppleProducts with @UI.SelectionFields: [
  productID,
  availability_code
];
annotate appleCartSrv.AppleProducts with @UI.LineItem #AppleProductsTable: [
    { $Type: 'UI.DataField', Value: productID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: availability_code, Criticality: availability.criticality }
];
annotate appleCartSrv.AppleProducts with @UI.SelectionPresentationVariant #AppleProductsTable: {
  Text : 'Available Apple Products',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#AppleProductsTable']
  }
};
annotate appleCartSrv.AppleProducts with @UI.LineItem #ShoppingCartSummary: [
    { $Type: 'UI.DataField', Value: ShoppingCarts.totalPrice },
    { $Type: 'UI.DataField', Value: ShoppingCarts.quantity }
];
annotate appleCartSrv.AppleProducts with @UI.SelectionPresentationVariant #ShoppingCartSummary: {
  Text : 'Shopping Cart Summary',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#ShoppingCartSummary']
  }
};
annotate appleCartSrv.AppleProducts with @UI.FieldGroup #productDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: productID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: availability_code, Criticality: availability.criticality }

  ]
};


annotate appleCartSrv.ShoppingCarts with @UI.LineItem #shoppingCarts: [
    { $Type: 'UI.DataField', Value: cartID },
    { $Type: 'UI.DataField', Value: productList },
    { $Type: 'UI.DataField', Value: totalPrice },
    { $Type: 'UI.DataField', Value: quantity }

  ];


annotate appleCartSrv.AppleProducts with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'overviewTab',
    Label: 'Overview',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'productDetails', Label: 'Product Details', Target: '@UI.FieldGroup#productDetails' },
      { $Type: 'UI.ReferenceFacet', ID: 'shoppingCarts', Label: 'Shopping Carts', Target: 'ShoppingCarts/@UI.LineItem#shoppingCarts' } ]
  }
];
annotate appleCartSrv.ShoppingCarts with {
  appleProducts @Common.ValueList: {
    CollectionPath: 'AppleProducts',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: appleProducts_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'availability_code'
      },
    ],
  }
};
annotate appleCartSrv.ShoppingCarts with @UI.DataPoint #productList: {
  Value: productList,
  Title: 'Product List',
};
annotate appleCartSrv.ShoppingCarts with @UI.DataPoint #totalPrice: {
  Value: totalPrice,
  Title: 'Total Price',
};
annotate appleCartSrv.ShoppingCarts with @UI.DataPoint #quantity: {
  Value: quantity,
  Title: 'Quantity',
};
annotate appleCartSrv.ShoppingCarts with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#productList', ID: 'ProductList' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#totalPrice', ID: 'TotalPrice' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#quantity', ID: 'Quantity' }
];
annotate appleCartSrv.ShoppingCarts with @UI.HeaderInfo: {
  TypeName: 'Shopping Cart',
  TypeNamePlural: 'Shopping Carts',
  Title: { Value: cartID }
};
annotate appleCartSrv.ShoppingCarts with {
  ID @UI.Hidden
};
annotate appleCartSrv.ShoppingCarts with @UI.Identification: [{ Value: cartID }];
annotate appleCartSrv.ShoppingCarts with {
  cartID @Common.Label: 'Cart ID';
  productList @Common.Label: 'Product List';
  totalPrice @Common.Label: 'Total Price';
  quantity @Common.Label: 'Quantity';
  appleProducts @Common.Label: 'Apple Product'
};
annotate appleCartSrv.ShoppingCarts with {
  ID @Common.Text: { $value: cartID, ![@UI.TextArrangement]: #TextOnly };
  appleProducts @Common.Text: { $value: appleProducts.productID, ![@UI.TextArrangement]: #TextOnly };
};
annotate appleCartSrv.ShoppingCarts with @UI.SelectionFields: [
  appleProducts_ID
];
annotate appleCartSrv.ShoppingCarts with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: cartID },
    { $Type: 'UI.DataField', Value: productList },
    { $Type: 'UI.DataField', Value: totalPrice },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Label: 'Apple Product', Value: appleProducts_ID }
];
annotate appleCartSrv.ShoppingCarts with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: cartID },
    { $Type: 'UI.DataField', Value: productList },
    { $Type: 'UI.DataField', Value: totalPrice },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Label: 'Apple Product', Value: appleProducts_ID }
]};
annotate appleCartSrv.ShoppingCarts with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];