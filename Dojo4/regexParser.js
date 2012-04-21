var detectQuant = function (regex) {
    var start = regex.indexOf('{');
    var end = regex.indexOf('}');

    if (start != -1 && end != -1 && start < end) {
        var qstr = regex.substring(start + 1, end);
        var num_arr = qstr.split(',');

        if (num_arr.length == 2)
            return [regex[start - 1], num_arr[0], num_arr[1]];
    }

    return [];
};


exports.parse = function (regex, inputStr) {
    var retval = [];

    var quant_arr = detectQuant(regex);

    if (quant_arr.length == 3) {
        var cnt = 0;

        for (var i = 0; i < inputStr.length; i++) {
            if (inputStr[i] == quant_arr[0]) {
                if (cnt == quant_arr[2]) {
                    retval.push(inputStr.substring(i - cnt, i));
                    cnt = 0;
                } else {
                    cnt++;
                }
            } else {
                if (cnt >= quant_arr[1]) {
                    retval.push(inputStr.substring(i - cnt, i));
                }
                cnt = 0;
            }
        }


    }
    else if ("$" == regex[regex.length - 1]) {
        var ending = regex.split("$")[0];
        if (inputStr.lastIndexOf(ending) == inputStr.length - (ending.length)) {
            retval.push(ending);
        }
    } else if ("^" == regex[0]) {
        var beginnig = regex.split("^")[1];
        if ('' == inputStr.split(beginnig)[0]) {
            retval.push(beginnig);
        }
    } else
    if ('.' == regex) {
        retval = inputStr.split('');
    } else if ("\\d" == regex) {
        for (var i = 0; i < inputStr.length; i++) {
            var num = inputStr[i];
            if (num >= '0' && num <= '9')
                retval.push(num);
        }
    } else if ("\\D" == regex) {
        for (var i = 0; i < inputStr.length; i++) {
            var num = inputStr[i];
            if (!(num >= '0' && num <= '9')) {
                retval.push(num);
            }
        }
    } else if (regex[regex.length - 1] == '.') {
        var exactMatch = regex.split('.')[0];
        var counter = 0;
        for (var i = 0; i < inputStr.length; i++) {

            if (inputStr[i] == exactMatch[counter]) {
                counter++;
            } else {
                counter = 0;
            }
            if (counter == exactMatch.length) {
                i++;
                if (inputStr[i] !== undefined) {
                    retval.push(exactMatch + inputStr[i]);
                }
            }
        }
    } else if (regex.length > 1) {
        var splitArr = inputStr.split(regex);
        for (var i = 1; i < splitArr.length; i++) {
            retval.push(regex);
        }
    }

    return retval;
};