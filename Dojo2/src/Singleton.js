var instance = undefined;

exports.getInstance = function () {
    return instance === undefined ? (instance = {name:"singleton"}) : instance;
};