mockTest = require "./mock.coffee"

describe "mock spec", ->
  it "test from export", ->
    spyOn mockTest, 'myFunc'
    mockTest.myFunc "qwe"
    expect(mockTest.myFunc).toHaveBeenCalled()
    expect(mockTest.myFunc.calls.length).toBe 1
    expect(mockTest.myFunc).toHaveBeenCalledWith 'qwe'
    expect(mockTest.myFunc.calls[0].args[0]).toBe 'qwe'
