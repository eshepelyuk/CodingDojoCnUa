rotation = require "./rotation.coffee"

describe 'rotate L sprite clockwise once', ->
  it 'state should  be increased by 1', ->
    sprite = {state: 0}
    expect(rotation.rotateClockwise(sprite).state).toBe 1
  it 'state should be 0 when current state is equal to 3', ->
    sprite = {state: 3}
    expect(rotation.rotateClockwise(sprite).state).toBe 0
  it 'bottomY and leftX should be unchanged, rightX should be increased by 1 when state changes from 0 to 1', ->
    sprite = {state: 0, bottomY: 17, leftX: 0, rightX: 1 }
    actualResult = rotation.rotateClockwise(sprite)
    expect(actualResult.bottomY).toBe 17
    expect(actualResult.leftX).toBe 0
    expect(actualResult.rightX).toBe 2
    expect(sprite.bottomY).toBe 17
    expect(sprite.leftX).toBe 0
    expect(sprite.rightX).toBe 1
  it 'leftX should be unchanged, bottomY decreased by 2, rightX should be decrise by 1 when state changes from 1 to 2', ->
    sprite = {state: 1, bottomY: 17, leftX: 0, rightX: 2}
    actualResult = rotation.rotateClockwise(sprite)
    expect(actualResult.bottomY).toBe 15
    expect(actualResult.leftX).toBe 0
    expect(actualResult.rightX).toBe 1
    expect(sprite.bottomY).toBe 17
    expect(sprite.leftX).toBe 0
    expect(sprite.rightX).toBe 2
  it 'leftX should be unchanged, bottomY increased by 2, rightX should be incresed by 1 when state changes from 2 to 3', ->
    sprite = {state: 2, bottomY: 15, leftX: 0, rightX: 1}
    actualResult = rotation.rotateClockwise(sprite)
    expect(actualResult.bottomY).toBe 17
    expect(actualResult.leftX).toBe 0
    expect(actualResult.rightX).toBe 2
    expect(sprite.bottomY).toBe 15
    expect(sprite.leftX).toBe 0
    expect(sprite.rightX).toBe 1
  it 'leftX and bottomY should be unchanged, rightX should be decreaced by 1 when state changes from 3 to 0', ->
    sprite = {state: 3, bottomY: 17, leftX: 0, rightX: 2}
    actualResult = rotation.rotateClockwise(sprite)
    expect(actualResult.bottomY).toBe 17
    expect(actualResult.leftX).toBe 0
    expect(actualResult.rightX).toBe 1
    expect(sprite.bottomY).toBe 17
    expect(sprite.leftX).toBe 0
    expect(sprite.rightX).toBe 2

describe 'rotate L sprite counter clockwise once', ->
  it 'state should  be decreased by 1', ->
    sprite = {state: 0}
    expect(rotation.rotateCounterClockwise(sprite).state).toBe 3
    sprite = {state: 2}
    expect(rotation.rotateCounterClockwise(sprite).state).toBe 1
    sprite = {state: 1}
    expect(rotation.rotateCounterClockwise(sprite).state).toBe 0
    sprite = {state: 3}
    expect(rotation.rotateCounterClockwise(sprite).state).toBe 2
  it 'bottomY and leftX should be unchanged, rightX should be increased by 1 when state changes from 0 to 3', ->
    sprite = {state: 0, bottomY: 17, leftX: 0, rightX: 1 }
    actualResult = rotation.rotateCounterClockwise(sprite)
    expect(actualResult.bottomY).toBe 17
    expect(actualResult.leftX).toBe 0
    expect(actualResult.rightX).toBe 2
    expect(sprite.bottomY).toBe 17
    expect(sprite.leftX).toBe 0
    expect(sprite.rightX).toBe 1
  it 'leftX should be unchanged, bottomY should be decreased by 2 rightX should be decreased by 1 when state changes from 3 to 2', ->
    sprite = {state: 3, bottomY: 17, leftX: 0, rightX: 2 }
    actualResult = rotation.rotateCounterClockwise(sprite)
    expect(actualResult.bottomY).toBe 15
    expect(actualResult.leftX).toBe 0
    expect(actualResult.rightX).toBe 1
    expect(sprite.bottomY).toBe 17
    expect(sprite.leftX).toBe 0
    expect(sprite.rightX).toBe 2
  it 'leftX should be unchanged, bottomY should be increased by 2 rightX should be increased by 1 when state changes from 2 to 1', ->
    sprite = {state: 2, bottomY: 15, leftX: 0, rightX: 1 }
    actualResult = rotation.rotateCounterClockwise(sprite)
    expect(actualResult.bottomY).toBe 17
    expect(actualResult.leftX).toBe 0
    expect(actualResult.rightX).toBe 2
    expect(sprite.bottomY).toBe 15
    expect(sprite.leftX).toBe 0
    expect(sprite.rightX).toBe 1
  it 'leftX and bottomY should be unchanged,  rightX should be decreased by 1 when state changes from 1 to 0', ->
    sprite = {state: 1, bottomY: 17, leftX: 0, rightX: 2 }
    actualResult = rotation.rotateCounterClockwise(sprite)
    expect(actualResult.bottomY).toBe 17
    expect(actualResult.leftX).toBe 0
    expect(actualResult.rightX).toBe 1
    expect(sprite.bottomY).toBe 17
    expect(sprite.leftX).toBe 0
    expect(sprite.rightX).toBe 2