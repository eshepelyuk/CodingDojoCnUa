minesweeper = require "./minesweeper.coffee"

describe 'Test', ->
  it 'ItShouldIncreaseInputRowBy2', ->
    inField = ["q", "w"]
    outField = minesweeper.extendSrcField inField
    expect(inField.length).toBe outField.length - 2

  it 'ItShouldIncreaseEachInputColumnsBy2', ->
    inField = ["*..", "..."]
    outField = minesweeper.extendSrcField inField
    expect(outField[1].length - 2).toBe inField[0].length
    expect(outField[2].length - 2).toBe inField[1].length

  it 'ItShouldIncreaseInputFieldDimenstionsAndFillLinesWithZero', ->
    inField = ["...", "..."]
    outField = minesweeper.extendSrcField inField
    expect(outStr).toEqual [0, 0, 0, 0, 0] for outStr in outField

  it 'shouldIncreaseCounterFromLeft&FromRight', ->
    inField = ["*.."]
    expectedOutField = [1, '*', 1, 0, 0]
    actualOutField = minesweeper.extendSrcField inField
    expect(actualOutField[1]).toEqual expectedOutField

  it 'shouldIncreaseCountersAroundMine', ->
    inField = ["*.*"]
    expectedOutField = [
      [1, 1, 2, 1, 1],
      [1, '*', 2, '*', 1],
      [1, 1, 2, 1, 1]
    ]
    actualOutField = minesweeper.extendSrcField inField
    expect(actualOutField).toEqual expectedOutField

  it 'shouldPlaceMineOnTherRigthPlace', ->
    inField = ["*.*."]
    expectedOutField = [
      [1, 1, 2, 1, 1, 0],
      [1, '*', 2, '*', 1, 0],
      [1, 1, 2, 1, 1, 0]
    ]
    actualOutField = minesweeper.extendSrcField inField
    expect(actualOutField).toEqual expectedOutField

  it 'shouldReduceDimentionsToInitialSize', ->
    inField = [
      [1, 0, 0, 0],
      [0, 2, 0, 0],
      [0, 0, 3, 0],
      [0, 0, 0, 4]
    ]

    expected = [
      [2, 0],
      [0, 3]
    ]

    actualField = minesweeper.reduceDimentions(inField)
    expect(actualField.length).toBe 2
    expect(actualField[0].length).toBe 2
    expect(actualField[1].length).toBe 2

    expect(actualField).toEqual expected

  it 'AccTest1', ->
    input = [
      '*...',
      '....',
      '.*..',
      '....'
    ]


    expected = [
      ["*", 1, 0, 0],
      [2, 2, 1, 0],
      [1, "*", 1, 0],
      [1, 1, 1, 0]
    ]

    expect(minesweeper.reduceDimentions(minesweeper.extendSrcField(input))).toEqual expected

  it 'AccTest2', ->
    input = [
      '**...',
      '.....',
      '.*...']

    expected = [
      ['*', '*', 1, 0, 0],
      [3, 3, 2, 0, 0],
      [1, '*', 1, 0, 0]

    ]

    expect(minesweeper.reduceDimentions(minesweeper.extendSrcField(input))).toEqual expected


