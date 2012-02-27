exports.extractNextField = function (input) {
    if (input.length < 2) {
        throw 'too few strings';
    } else if (!parseInt(input[0])) {
        throw 'dimension string is NaN'
    } else if (!(parseInt(input[0]) > 10 && parseInt(input[0]) < 100)) {
        throw 'dimension too big or too low';
    }

    var rowsCount = parseInt(input[0][0]);
    var colsCount = parseInt(input[0][1]);

    if (input.length != (rowsCount + 1)) {
        throw 'count of parameters is not match to dimension value';
    }

    var retval = [];
    for (var i = 1; i < input.length; i++) {
        if (input[i].length != colsCount) {
            throw 'cols count is not match';
        }
        for (var j = 0; j < input[i].length; j++) {
            if ((input[i][j] !== '.') && (input[i][j] !== '*')) {
                throw 'invalid chars';
            }
        }
        retval[i - 1] = input[i];
    }
    return retval;
};

exports.minesAroundCell = function (i, j, field) {
    var minesCount = 0;

    if (field[i][j] === '*') return '*';

    // i is x dimension.
    // j is y dimension.
    // 1st column
    if (field[i][j - 1] !== undefined && field[i][j - 1] === '*') {
        minesCount++;
    }
    if (field[i][j + 1] !== undefined && field[i][j + 1] === '*') {
        minesCount++;
    }

    if (field[i - 1] !== undefined && field[i - 1][j] !== undefined && field[i - 1][j] === '*') {
        minesCount++;
    }
    if (field[i + 1] !== undefined && field[i + 1][j] !== undefined && field[i + 1][j] === '*') {
        minesCount++;
    }


    if (field[i - 1] !== undefined && field[i - 1][j - 1] === '*') {
        minesCount++;
    }
    if (field[i + 1] !== undefined && field[i + 1][j + 1] === '*') {
        minesCount++;
    }


    if (field[i - 1] !== undefined && field[i - 1][j + 1] === '*') {
        minesCount++;
    }
    if (field[i + 1] !== undefined && field[i + 1][j - 1] === '*') {
        minesCount++;
    }

    return minesCount;
};


exports.processField = function (field) {
    var retval = [];

    for (var i = 0; i < field.length; i++) {
        retval[i] = '';
        for (var j = 0; j < field.length; j++) {
            console.log(exports.minesAroundCell(i, j, field));
            retval[i] += exports.minesAroundCell(i, j, field);
        }
    }
    return retval;
};



/*
* */