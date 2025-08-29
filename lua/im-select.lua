local M = {}

M.closed = false

local function all_trim(s)
    return s:match("^%s*(.-)%s*$")
end

-- local config
local C = {
    -- im-select binary's name, or the binary's full path
    default_command = "im-select",
    -- default input method in normal mode.
    default_method_selected = "us",

    -- Restore the default input method state when the following events are triggered
    set_default_events = { "VimEnter", "InsertLeave" },
    -- Restore the previous used input method state when the following events are triggered
    set_previous_events = { "InsertEnter" },

    keep_quiet_on_no_binary = false,

    async_switch_im = true,
}

local function get_current_select(cmd)
    local command = {}
    command = { cmd }
    return all_trim(vim.fn.system(command))
end

local function change_im_select(cmd, method)
    local args = {}
    args = { method }

    local handle
    handle, _ = vim.loop.spawn(
        cmd,
        { args = args, detach = true },
        vim.schedule_wrap(function(_, _)
            if handle and not handle:is_closing() then
                handle:close()
            end
            M.closed = true
        end)
    )
    if not handle then
        vim.api.nvim_err_writeln([[[im-select]: Failed to spawn process for ]] .. cmd)
    end

    if not C.async_switch_im then
        vim.wait(5000, function()
            return M.closed
        end, 200)
    end
end

local function restore_default_im()
    local current = get_current_select(C.default_command)
    vim.api.nvim_set_var("im_select_saved_state", current)

    if current ~= C.default_method_selected then
        change_im_select(C.default_command, C.default_method_selected)
    end
end

local function restore_previous_im()
    local current = get_current_select(C.default_command)
    local saved = vim.g["im_select_saved_state"]

    if current ~= saved then
        change_im_select(C.default_command, saved)
    end
end

M.setup = function(opts)

    if vim.fn.executable(C.default_command) ~= 1 then
        if not C.keep_quiet_on_no_binary then
            vim.api.nvim_err_writeln([[[im-select]: binary tools missed, please follow installation manual in README]])
        end
        return
    end

    -- set autocmd
    local group_id = vim.api.nvim_create_augroup("im-select", { clear = true })

    if #C.set_previous_events > 0 then
        vim.api.nvim_create_autocmd(C.set_previous_events, {
            callback = restore_previous_im,
            group = group_id,
        })
    end

    if #C.set_default_events > 0 then
        vim.api.nvim_create_autocmd(C.set_default_events, {
            callback = restore_default_im,
            group = group_id,
        })
    end
end

return M
