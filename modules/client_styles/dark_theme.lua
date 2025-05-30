-- Lightweight Dark Theme Implementation
-- Minimizes memory usage and complexity

DarkTheme = {}

-- Simple color definitions
local DARK_BG = '#222222'
local PANEL_BG = '#1A1A1A'
local BUTTON_BG = '#333333'
local TEXT_COLOR = '#FFFFFF'

-- Apply dark theme to a widget (simplified version)
function DarkTheme.applyToWidget(widget)
  if not widget then return end
  
  -- Skip if widget doesn't exist anymore
  if not widget:isVisible() then return end
  
  local styleName = widget:getStyleName()
  
  -- Apply minimal styling based on widget type
  if styleName:find('Window') then
    pcall(function() widget:setImageColor(DARK_BG) end)
    pcall(function() widget:setColor(TEXT_COLOR) end)
  elseif styleName:find('Panel') then
    pcall(function() widget:setImageColor(PANEL_BG) end)
  elseif styleName:find('Button') then
    pcall(function() widget:setImageColor(BUTTON_BG) end)
    pcall(function() widget:setColor(TEXT_COLOR) end)
  elseif styleName:find('Label') or styleName:find('Text') then
    pcall(function() widget:setColor(TEXT_COLOR) end)
  elseif styleName:find('TextEdit') then
    pcall(function() widget:setImageColor(PANEL_BG) end)
    pcall(function() widget:setColor(TEXT_COLOR) end)
  end
  
  -- Apply to children recursively, but limit depth to avoid stack issues
  local children = widget:getChildren()
  if #children < 50 then -- Limit to reasonable number of children
    for _, child in pairs(children) do
      DarkTheme.applyToWidget(child)
    end
  end
end

-- Apply dark theme to all UI elements (simplified)
function DarkTheme.apply()
  -- Apply to root widget
  local rootWidget = g_ui.getRootWidget()
  if not rootWidget then return end
  
  -- Apply to main UI containers only
  for _, child in pairs(rootWidget:getChildren()) do
    if child:getId() == 'background' or 
       child:getId() == 'gameWindow' or
       child:getId() == 'mainMenu' or
       child:getStyleName():find('Window') then
      pcall(function() DarkTheme.applyToWidget(child) end)
    end
  end
end

-- Connect to game events
function init()
  connect(g_game, { onGameStart = DarkTheme.apply })
  
  -- Apply theme when module loads with a delay
  scheduleEvent(function() DarkTheme.apply() end, 1000)
  scheduleEvent(function() DarkTheme.apply() end, 3000)
end

function terminate()
  disconnect(g_game, { onGameStart = DarkTheme.apply })
end