-- this file is loaded after all modules are loaded and initialized
-- you can place any custom user code here

-- Apply dark theme safely with minimal overhead
if modules.client_styles and modules.client_styles.DarkTheme then
  local status, err = pcall(function() modules.client_styles.DarkTheme.apply() end)
  if not status then
    print('Error applying dark theme: ' .. tostring(err))
  end
  
  -- Apply once more after a delay
  scheduleEvent(function()
    if modules.client_styles and modules.client_styles.DarkTheme then
      pcall(function() modules.client_styles.DarkTheme.apply() end)
    end
  end, 2000)
end

-- Enable shaders safely (only if already enabled)
if g_shaders and type(g_shaders.isEnabled) == 'function' and g_shaders.isEnabled() then
  pcall(function()
    g_shaders.addShader('UI Glow', '/shaders/fragment/ui_glow.frag')
    g_shaders.setShaderForAllWindows('UI Glow')
  end)
end

print 'Startup done :]'

