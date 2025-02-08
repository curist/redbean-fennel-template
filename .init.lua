local fennel = require("fennel")
fennel.install()

fennel.path = fennel.path .. ";/zip/.lua/?.fnl"
fennel.path = fennel.path .. ";/zip/.lua/?/init.fnl"

function string:endswith(suffix)
  return self:sub(-#suffix) == suffix
end

function OnHttpRequest()
  local path = GetPath()
  if path:endswith(".fnl") then
    local module = string.gsub(path, "/", "")
    fennel.dofile("/zip/" .. module)
  else
    Write(path)
    Route()
  end
end

LaunchBrowser("/")
