convDigit = (arabDigit, romanDigitArr) ->
  result = ""
  if arabDigit in [1..3]
    for n in [1..arabDigit]
      result += romanDigitArr[0]
  if arabDigit is 4
    result = "#{romanDigitArr[0]}#{romanDigitArr[1]}"
  if arabDigit in [5..8]
    tmp = convDigit(arabDigit - 5, romanDigitArr)
    result = "#{romanDigitArr[1]}#{tmp}"
  if arabDigit is 9
    result = "#{romanDigitArr[0]}#{romanDigitArr[2]}"
  return result

romanArray = [
  ['I', 'V', 'X']
  ['X', 'L', 'C']
  ['C', 'D', 'M']
  ['M', '', '']
]

reversestr = (str) ->
  char = []
  char.unshift(parseInt(ch)) for ch in str
  return char

exports.int2rome = (value) ->
  throw "more then 3000" if value > 3999
  throw "less or equal 0" if value <= 0
  result = ""
  for arabDigit, ind in reversestr("#{value}")
    result = "#{convDigit(arabDigit, romanArray[ind])}#{result}"
  return result

exports.convDigit = convDigit
exports.reversestr = reversestr