-- UI Animation Module

Animations = {}

function init()
  connect(g_game, { onGameStart = refresh })
  connect(g_game, { onGameEnd = refresh })
  
  -- Initialize animations when module loads
  scheduleEvent(function() refresh() end, 100)
end

function terminate()
  disconnect(g_game, { onGameStart = refresh })
  disconnect(g_game, { onGameEnd = refresh })
end

function refresh()
  -- Add fade-in animation to windows when they appear
  local rootWidget = g_ui.getRootWidget()
  if not rootWidget then return end
  
  for _, child in pairs(rootWidget:getChildren()) do
    if child:getStyleName():find('Window') then
      addFadeInEffect(child)
    end
  end
end

function addFadeInEffect(widget)
  if not widget then return end
  
  widget:setOpacity(0)
  widget:show()
  
  local fadeEffect = g_effects.fadeIn(widget, 300)
  connect(fadeEffect, { onFinished = function()
    widget:setOpacity(0.95)
  end})
  
  fadeEffect:start()
end

function addPulseEffect(widget, startOpacity, endOpacity, duration)
  if not widget then return end
  
  startOpacity = startOpacity or 0.7
  endOpacity = endOpacity or 1.0
  duration = duration or 1000
  
  local pulseEffect = g_effects.pulse(widget, startOpacity, endOpacity, duration)
  pulseEffect:start()
  
  return pulseEffect
end

function addMoveEffect(widget, startPos, endPos, duration)
  if not widget then return end
  
  local moveEffect = g_effects.move(widget, startPos, endPos, duration or 300)
  moveEffect:start()
  
  return moveEffect
end

-- Export functions to global scope
window = {}
window.fadeIn = addFadeInEffect
window.pulse = addPulseEffect
window.move = addMoveEffect