exports.hello = (name) ->
  myName = "#{name} !!!"
  return "HELLO #{myName}"

exports.arabicToRoman = (val) ->
  if val is 0 then return "fail"
  if val > 3999 then return "fail"
  romanians = [
    ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
    ["X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    ["C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    ["M", "MM", "MMM"]
  ]
  divElem = 1000
  order = val
  retval = ''
  for i in [3..0]
    digit = (val - val % divElem) / divElem
    if (digit > 0) then retval += romanians[i][digit - 1]
    val = val % divElem
    divElem = divElem / 10
  return retval

