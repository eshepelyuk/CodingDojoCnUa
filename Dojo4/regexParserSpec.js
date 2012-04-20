var regexParser = require("./regexParser.js");

describe('regex test', function () {
    it('test', function () {
        expect(regexParser.parse()).toBe(1);
    });
});