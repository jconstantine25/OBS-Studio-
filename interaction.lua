obs = obslua

-- Function to refresh the browser source
function refresh_browser_source(name)
    local source = obs.obs_get_source_by_name(name)
    if source then
        local settings = obs.obs_source_get_settings(source)
        obs.obs_source_update(source, settings)
        obs.obs_source_release(source)
    end
end

-- Call this function after you have logged in via external tools
function script_description()
    return "This script refreshes the browser source."
end

function script_load(settings)
    print("Script loaded")
end

function script_unload()
    print("Script unloaded")
end

-- Example usage: refresh the source named "My Browser Source"
refresh_browser_source("My Browser Source")
