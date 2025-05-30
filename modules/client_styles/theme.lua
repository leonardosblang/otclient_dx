-- Dark Theme Configuration

Theme = {}

-- Color palette
Theme.COLORS = {
  PRIMARY = '#121212',
  SECONDARY = '#1F1F1F',
  ACCENT = '#BB86FC',
  TEXT_PRIMARY = '#FFFFFF',
  TEXT_SECONDARY = '#B3B3B3',
  BACKGROUND = '#000000',
  SURFACE = '#121212',
  ERROR = '#CF6679',
  SUCCESS = '#03DAC5',
  WARNING = '#FFAB40',
  INFO = '#2196F3'
}

-- Font configuration
Theme.FONTS = {
  PRIMARY = 'verdana-11px-antialised',
  PRIMARY_BOLD = 'verdana-bold-11px-antialised',
  ROUNDED = 'verdana-11px-rounded',
  BOLD_ROUNDED = 'verdana-bold-11px-rounded',
  SMALL = 'verdana-11px-antialised',
  TINY = 'verdana-11px-antialised'
}

-- Apply theme to UI elements
function Theme.apply()
  -- Apply shader to UI elements if available
  if g_shaders and type(g_shaders.isEnabled) == 'function' and g_shaders.isEnabled() then
    g_shaders.addShader('UI Glow', '/shaders/fragment/ui_glow.frag')
    g_shaders.setShaderForAllWindows('UI Glow')
  end
  
  -- Apply animations if available
  if _G['Animations'] then
    Animations.refresh()
  end
end

function init()
  connect(g_game, { onGameStart = Theme.apply })
  
  -- Apply theme when module loads
  scheduleEvent(function() Theme.apply() end, 500)
end

function terminate()
  disconnect(g_game, { onGameStart = Theme.apply })
end