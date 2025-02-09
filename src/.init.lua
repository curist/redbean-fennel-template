require("fennel-install")

HidePath("/usr/share")

function string:endswith(suffix)
  return self:sub(-#suffix) == suffix
end

local function renderPage(pages)
  local hup = require("hup")
  local Page = pages[GetMethod()] or require("NotFoundPage")
  Write(hup(require("SakuraCSS")()))
  Write(hup(Page()))
end

function OnHttpRequest()
  local p = GetPath()
  if p:endswith(".fnl") then
    local pages = require(p:gsub(".fnl$", ""))
    renderPage(pages)
  elseif p:endswith("/") and path.exists("/zip" .. p .. "index.fnl") then
    local pages = require(p .. "index")
    renderPage(pages)
  else
    Route()
  end
end

LaunchBrowser()
