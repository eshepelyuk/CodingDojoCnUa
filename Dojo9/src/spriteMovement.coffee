shapes = require "./shapes.coffee"


exports.moveDown = (sprite) ->
  if sprite.bottomY > 0
    sprite.bottomY = sprite.bottomY - 1
  return sprite

exports.moveRight = (sprite) ->
  if sprite.rightX < 9
    sprite.rightX += 1
    sprite.leftX += 1
  return sprite

exports.moveLeft = (sprite) ->
  if sprite.leftX > 0
    sprite.leftX -= 1
    sprite.rightX -= 1
  return sprite