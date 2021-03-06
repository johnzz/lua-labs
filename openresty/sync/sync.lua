local log = ngx.log
local level = ngx.ERR
local tostring = tostring
local sleep = ngx.sleep
local unpack = unpack
local pcall = pcall
local key = "__SYNC__:LOCK"

local _M = {}

function _M.run(dict, f, t)
    while true do
        local ok, err = dict:add(key, 1, 1)
        if ok and not err then break end
        sleep(0)
    end
    local ok, val = pcall(f, unpack(t))
    dict:delete(key)
    if not ok then
        log(level, "sync.run error [" .. tostring(val) .. "]")
    end
    return ok, val
end

return _M