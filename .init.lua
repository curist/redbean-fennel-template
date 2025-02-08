local fennel = require("fennel")
fennel.install()

fennel.path = fennel.path .. ";/zip/.lua/?.fnl"
fennel.path = fennel.path .. ";/zip/.lua/?/init.fnl"

function string:endswith(suffix)
  return self:sub(-#suffix) == suffix
end

function OnHttpRequest()
  local p = GetPath()
  if p:endswith(".fnl") then
    fennel.dofile("/zip" .. p)
  elseif p:endswith("/") and path.exists("/zip" .. p .. "index.fnl") then
    fennel.dofile("/zip" .. p .. "index.fnl")
  else
    Route()
  end
end

LaunchBrowser("/")
