var Product = function () {
    this.name = 'Product'
};
exports.Product = Product;

var Colbaza = function () {
    this.name = 'Colbaza'
};
exports.Colbaza = Colbaza;

var Pizza = function () {
    this.name = 'Pizza'
};
exports.Pizza = Pizza;


var ProdcutCreator = function () {
    this.createProduct = function () {
        return new Product();
    }
};

exports.factoryMethod = function (param) {
    if ('C' == param) {
        return new Colbaza();
    } else if ('Pr' == param) {
        return new Product();
    } else if ('Pz' == param) {
        return new Pizza();
    }
    return undefined;
};
