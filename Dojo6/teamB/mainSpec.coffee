main = require "./main.coffee"

describe 'test input parameter', ->
  it 'parameter should be greater than 0', ->
    expect(main.arabicToRoman 0).toBe "fail"

  it 'parameter should be less than 4000', ->
    expect(main.arabicToRoman 4000).toBe "fail"
  it 'if parametr GT 0 and LT 4000 than result should not be fail', ->
    expect(main.arabicToRoman num).not.toBe "fail" for num in [1..3999]
  it 'Lower order of number', ->
    expect(main.arabicToRoman num).toBe ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"][num - 1]  for num in [1..9]
  it "second order of number", ->
    expect(main.arabicToRoman num).toBe ["X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"][num / 10 - 1] for num in [10..90] by 10
  it "third order of number", ->
    expect(main.arabicToRoman num).toBe ["C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"][num / 100 - 1] for num in [100..900] by 100
  it "4th order of number", ->
    expect(main.arabicToRoman num).toBe ["M", "MM", "MMM"][num / 1000 - 1] for num in [1000..3000] by 1000
  it "1984 have to be equals MCMLXXXIV", ->
    expect(main.arabicToRoman(1984)).toBe "MCMLXXXIV"
  it "acceptance", ->
    expect(main.arabicToRoman 1984).toBe "MCMLXXXIV"
    expect(main.arabicToRoman 1684).toBe "MDCLXXXIV"
    expect(main.arabicToRoman 956).toBe "CMLVI"
    expect(main.arabicToRoman 3587).toBe "MMMDLXXXVII"
    expect(main.arabicToRoman 13).toBe "XIII"
    expect(main.arabicToRoman 9).toBe "IX"
    expect(main.arabicToRoman 1982).toBe "MCMLXXXII"
    expect(main.arabicToRoman 1990).toBe "MCMXC"
    expect(main.arabicToRoman 2040).toBe "MMXL"
    expect(main.arabicToRoman 1082).toBe "MLXXXII"
    expect(main.arabicToRoman 3999).toBe "MMMCMXCIX"
