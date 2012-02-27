var minesweeper = require("./minesweeper.js");

describe('minesweeper kata test', function () {
    it('if format of field size is incorrect than throwing exception', function () {
        var input = [];
        expect(
            function () {
                minesweeper.extractNextField(input)
            }).toThrow('too few strings');

        input = ['344'];
        expect(
            function () {
                minesweeper.extractNextField(input)
            }).toThrow('too few strings');

        input = ['3', 'qwe'];
        expect(
            function () {
                minesweeper.extractNextField(input)
            }).toThrow('dimension too big or too low');

        input = ['344', 'qwe'];
        expect(
            function () {
                minesweeper.extractNextField(input)
            }).toThrow('dimension too big or too low');

        input = ['qwe', 'qwe'];
        expect(
            function () {
                minesweeper.extractNextField(input)
            }).toThrow('dimension string is NaN');

        input = ['31', 'qwe1', 'qwe2', 'qwe3', 'qwe4'];
        expect(
            function () {
                minesweeper.extractNextField(input)
            }).toThrow('count of parameters is not match to dimension value');

        input = ['33', 'qwe1', 'qwe2', 'qwe3'];
        expect(
            function () {
                minesweeper.extractNextField(input)
            }).toThrow('cols count is not match');
    });


    it('check on valid data (.*)', function () {
        var input = ['34', '..*.', '.*..', '...q'];
        expect(
            function () {
                minesweeper.extractNextField(input)
            }).toThrow('invalid chars');
    });

    it('output without first element', function () {
        var input = ['34', '..*.', '.*..', '....'];
        var expected = ['..*.', '.*..', '....'];
        var actual = minesweeper.extractNextField(input);
        expect(actual).not.toBeUndefined();
        expect(expected.length).toBe(actual.length);
        for (var i = 0; i < expected.length; i++) {
            expect(expected[i]).toBe(actual[i]);
        }
    });

    it('should not return mines for mine cell', function () {
        var input = ['*'];
        expect(minesweeper.minesAroundCell(0, 0, input)).toBe('*');
    });

    it('Mines should be detected from left and rigth', function () {
        var input = ['.*.'];
        expect(minesweeper.minesAroundCell(0, 0, input)).toBe(1);
        expect(minesweeper.minesAroundCell(0, 2, input)).toBe(1);

        input = ['*.*'];
        expect(minesweeper.minesAroundCell(0, 1, input)).toBe(2);

    });

    it('Mines should be detected from top and bottom', function () {
        var input = ['.', '*', '.'];
        expect(minesweeper.minesAroundCell(0, 0, input)).toBe(1);
        expect(minesweeper.minesAroundCell(2, 0, input)).toBe(1);

        input = ['*', '.', '*'];
        expect(minesweeper.minesAroundCell(1, 0, input)).toBe(2);

        input = ['.', '.', '*'];
        expect(minesweeper.minesAroundCell(0, 0, input)).toBe(0);


    });


    it('Mines should be detected from top left and bottom right', function () {
        var input = [
            '...',
            '.*.',
            '...'];
        expect(minesweeper.minesAroundCell(0, 0, input)).toBe(1);
        expect(minesweeper.minesAroundCell(2, 2, input)).toBe(1);

        input = [
            '*..',
            '...',
            '..*'];
        expect(minesweeper.minesAroundCell(1, 1, input)).toBe(2);
    });

    it('Mines should be detected from top right and bottom left', function () {
        var input = [
            '...',
            '.*.',
            '...'];
        expect(minesweeper.minesAroundCell(0, 2, input)).toBe(1);
        expect(minesweeper.minesAroundCell(2, 0, input)).toBe(1);

        input = [
            '..*',
            '...',
            '*..'];
        expect(minesweeper.minesAroundCell(1, 1, input)).toBe(2);
    });


    it('Size og input array should be equals to size output array', function () {
        var input = [
            '...',
            '.*.',
            '...'];
        var output = minesweeper.processField(input);
        expect(output).toBeDefined();
        expect(output.length).toBe(input.length);
        for (var i = 0; i < input.length; i++) {
            expect(output[i].length).toBe(input[i].length);
        }
    });

    it('Acceptance test', function () {

        var input = [
            '*...',
            '....',
            '.*..',
            '....'];

        var expected = [
            '*100',
            '2210',
            '1*10',
            '1110'
        ];

        var output = minesweeper.processField(input);
        for (var i = 0; i < input.length; i++) {
            expect(output[i]).toBe(expected[i]);
        }


    });
    it('Acceptance test 2', function () {

        var input = [
            '**...',
            '.....',
            '.*...'];

        var expected = [
            '**100',
            '33200',
            '1*100'

        ];

        var output = minesweeper.processField(input);
        for (var i = 0; i < input.length; i++) {
            expect(output[i]).toBe(expected[i]);
        }


    });
});
