rotation = require "./rotation.coffee"

exports.moveDown = (sprite, count = 1) ->
  newBottomY = sprite.bottomY - (if count < 0 then 0 else count)
  {leftX: sprite.leftX, rightX: sprite.rightX, bottomY: (if newBottomY < 0 then 0 else newBottomY), state: sprite.state}

exports.moveRight = (stakan, sprite, count = 1) ->
  delta = (if count < 0 then 0 else count)
  if (sprite.rightX + delta) > stakan.width
    delta = stakan.width - sprite.rightX
  {leftX: sprite.leftX + delta, rightX: sprite.rightX + delta, bottomY: sprite.bottomY, state: sprite.state}

exports.moveLeft = (sprite, count = 1) ->
  delta = (if count < 0 then 0 else count)
  if (sprite.leftX - delta) < 0
    delta = sprite.leftX
  {leftX: sprite.leftX - delta, rightX: sprite.rightX - delta, bottomY: sprite.bottomY, state: sprite.state}


exports.rotate = (stakan, shape, direction, count = 1) ->
  retval = shape
  for i in [1..count]
    if direction is "R"
      retval = rotation.rotateClockwise retval
    if direction is "L"
      retval = rotation.rotateCounterClockwise retval
  if retval.leftX < 0 or retval.rightX > stakan.width or retval.bottomY < 0 then retval = shape
  return retval
