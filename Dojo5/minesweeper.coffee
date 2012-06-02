exports.extendSrcField = (inField) ->
  outArray = []
  outStr = []

  for inStr in inField
    outStr = []
    outStr.push 0 for j in [0..inStr.length + 1]
    outArray.push outStr

  outStr = []
  outStr.push 0 for j in [0..inStr.length + 1]
  outArray.unshift outStr
  outStr = []
  outStr.push 0 for j in [0..inStr.length + 1]
  outArray.push outStr

  for s, i in inField
    for symbol, j in s
      if symbol is '*'
        dstI = i + 1
        dstJ = j + 1

        outArray[dstI][dstJ - 1]++
        #left
        outArray[dstI][dstJ + 1]++
        #rigth
        outArray[dstI - 1][dstJ]++
        #up
        outArray[dstI - 1][dstJ - 1]++
        #up -left
        outArray[dstI - 1][dstJ + 1]++
        #up -rigth
        outArray[dstI + 1][dstJ]++
        #down
        outArray[dstI + 1][dstJ - 1]++
        #down -left
        outArray[dstI + 1][dstJ + 1]++ #down -right

  for s, i in inField
    for symbol, j in s
      if symbol is '*'
        outArray[i + 1][j + 1] = '*'


  return outArray

exports.reduceDimentions = (inField) ->
  out = inField[1...inField.length - 1]
  # from 1 to last-1
  for outElement, i in out
    out[i] = outElement[1...outElement.length - 1]
  return out


