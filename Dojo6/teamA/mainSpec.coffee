main = require "./main.coffee"

describe '', ->
  it 'Throw exception when value more then 3000', ->
    expect(-> main.int2rome(5001)).toThrow "more then 3000"
  it 'Throw exception when value less or eq 0', ->
    expect(-> main.int2rome(0)).toThrow "less or equal 0"
  it 'return 1 to 3 roman lettet of 1st position if arab digit is from 1 to 3', ->
    expect(main.convDigit(1, ["q", "w", "e"])).toBe "q"
    expect(main.convDigit(2, ["q", "w", "e"])).toBe "qq"
    expect(main.convDigit(3, ["q", "w", "e"])).toBe "qqq"

  it 'return joinn 1 and 2 position of roman array when 4', ->
    expect(main.convDigit(4, ["q", "w", "e"])).toBe "qw"

  it 'return second and x-5 times from 5 to 8', ->
    expect(main.convDigit(5, ["q", "w", "e"])).toBe "w"
    expect(main.convDigit(6, ["q", "w", "e"])).toBe "wq"
    expect(main.convDigit(7, ["q", "w", "e"])).toBe "wqq"
    expect(main.convDigit(8, ["q", "w", "e"])).toBe "wqqq"

  it 'return 1st and 3rd roman letters when arab is 9', ->
    expect(main.convDigit(9, ["q", "w", "e"])).toBe "qe"

  it 'return empty when arab zero', ->
    expect(main.convDigit(0, ["q", "w", "e"])).toBe ""

  it 'input string return reverse symbol array', ->
    expect(main.reversestr "123").toEqual [3, 2, 1]

  it "convert one symbol", ->
    expect(main.int2rome(9)).toBe "IX"

  it "value 94 then XCIV", ->
    expect(main.int2rome(94)).toBe "XCIV"

  it "value 497 then CDXCVII", ->
    expect(main.int2rome(497)).toBe "CDXCVII"

  it "accepting test", ->
    expect(main.int2rome(1684)).toBe "MDCLXXXIV"
    expect(main.int2rome(1982)).toBe "MCMLXXXII"
    expect(main.int2rome(1990)).toBe "MCMXC"
    expect(main.int2rome(2040)).toBe "MMXL"
    expect(main.int2rome(1082)).toBe "MLXXXII"
    expect(main.int2rome(3999)).toBe "MMMCMXCIX"