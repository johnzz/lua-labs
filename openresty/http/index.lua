--------------------------------
-- TEST
--------------------------------
--[=[
curl -v --data "name=ivan" "http://localhost:3000/test"
curl -v "http://localhost:3000/test?name=alessandra"
lua get.lua
lua post.lua
--]=]

--------------------------------
-- LIBRARIES
--------------------------------

local json = require "cjson" 

--------------------------------
-- FUNCTIONS
--------------------------------

function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

function exit_now(status, msg)
    if status ~= ngx.HTTP_OK then
        ngx.status = status
    end

    if msg then
        ngx.say(msg)
    end

    ngx.exit(ngx.HTTP_OK)
end

function exit(status, msg)
    if status then
        exit_now(status, msg)
    end

    exit_now(ngx.HTTP_OK, msg)
end

function split(str, sep)
    local s = str..sep
    return s:match((s:gsub('[^'..sep..']*'..sep, '([^'..sep..']*)'..sep)))
end

-------------
-- MAIN
-------------

ngx.header.content_type = 'application/json';

local keys = {}

if ngx.req.get_method() == "POST" then
    ngx.req.read_body()
    -- data = ngx.req.get_body_data() -> string
    keys = ngx.req.get_post_args()
elseif ngx.req.get_method() == "GET" then
    keys = ngx.req.get_uri_args()
end

if keys["name"] then
    ngx.say(json.encode(keys))
    exit()
end

exit(ngx.HTTP_METHOD_NOT_IMPLEMENTED)
