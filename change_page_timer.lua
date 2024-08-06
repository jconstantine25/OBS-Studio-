If you want to use a Lua script in OBS Studio to change the URL of a Browser Source periodically (e.g., on a timer), you can modify the script to include a timer function. Lua scripting in OBS intervals:


Here’s how you can set up a Lua script to change the URL of a Browser Source at regular intervals:

Lua Script with Timer

	1.	Create the Lua Script:
Save the following Lua script to a file, e.g., change_page_timer.lua.

obs = obslua

local timer_interval = 30000  -- Timer interval in milliseconds (e.g., 30,000 ms = 30 seconds)
local current_url_index = 1
local urls = {
    "https://example.com/page1",
    "https://example.com/page2",
    "https://example.com/page3"
}

function change_browser_source_url(source_name, new_url)
    local source = obs.obs_get_source_by_name(source_name)
    if source then
        local settings = obs.obs_source_get_settings(source)
        obs.obs_data_set_string(settings, "url", new_url)
        obs.obs_source_update(source, settings)
        obs.obs_source_release(source)
    else
        print("Source not found: " .. source_name)
    end
end

function on_timer()
    local source_name = "My Browser Source"  -- Change this to your actual source name
    local new_url = urls[current_url_index]
    change_browser_source_url(source_name, new_url)
    
    -- Update to the next URL in the list, wrap around if necessary
    current_url_index = current_url_index % #urls + 1
end

function script_description()
    return "This script changes the URL of a Browser Source periodically."
end

function script_load(settings)
    obs.timer_add(on_timer, timer_interval)
end

function script_unload()
    obs.timer_remove(on_timer)
    print("Script unloaded")
end


	2.	Load the Script in OBS Studio:
	•	Open OBS Studio.
	•	Go to Tools > Scripts.
	•	Click the + button and select the Lua script file you created (change_page_timer.lua).
	3.	Customize the Script:
	•	timer_interval: Set the interval for URL changes in milliseconds. For example, 30000 ms = 30 seconds.
	•	urls: Replace the example URLs with the URLs you want to rotate through.
	•	source_name: Replace "My Browser Source" with the name of your Browser Source in OBS.
	4.	Run the Script:
	•	The script will automatically start changing the URL of the specified Browser Source at the defined interval once it’s loaded.

Summary

This script uses a timer to periodically change the URL of a Browser Source in OBS Studio. It cycles through a predefined list of URLs, updating the Browser Source at the specified interval. Adjust the timer_interval and urls list to fit your needs.
