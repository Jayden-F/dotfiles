local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/usr/bin/fd"

M.toggle = function(window, pane)
    local projects = {}

    local success, stdout, stderr = wezterm.run_child_process({
        fd,
        "-HI",
        "^.git$",
        "--max-depth=6",
        "--prune",
        os.getenv("HOME") .. "/repos",
        "--exec",
        "dirname",
    })

    if not success then
        wezterm.log_error("Failed to run fd: " .. stderr)
        return
    end

    window:perform_action(
        act.InputSelector({
            action = wezterm.action_callback(function(win, _, id, label)
                if not id and not label then
                    wezterm.log_info("Cancelled")
                else
                    wezterm.log_info("Selected " .. label)
                    win:perform_action(
                        act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }),
                        pane
                    )
                end
            end),
            fuzzy = true,
            title = "Select project",
            choices = projects,
        }),
        pane
    )
end

return M
