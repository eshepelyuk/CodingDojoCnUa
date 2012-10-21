shapes = require "./shapes.coffee"


exports.moveDown = (sprite) ->
  if sprite.bottomY > 0
    sprite.bottomY = sprite.bottomY - 1
  return sprite

