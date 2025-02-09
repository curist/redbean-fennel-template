require("fennel-install")

local hup = require("hup")
local SakuraCSS = hup(require("SakuraCSS")())
local NavBar = require("NavBar")

HidePath("/usr/share")

function string:endswith(suffix)
  return self:sub(-#suffix) == suffix
end

local function renderPage(pages)
  local Page = pages[GetMethod()] or require("NotFoundPage")
  Write(SakuraCSS)
  Write(hup(NavBar()))
  Write(hup(Page()))
end

function OnHttpRequest()
  local p = GetPath()
  if p:endswith(".fnl") then
    local found, pages = pcall(require, p:gsub(".fnl$", ""))
    if found then
      renderPage(pages)
    else
      Route()
    end
  elseif p:endswith("/") and path.exists("/zip" .. p .. "index.fnl") then
    local found, pages = pcall(require, p .. "index")
    if found then
      renderPage(pages)
    else
      Route()
    end
  else
    if p == "/" then
      Write(SakuraCSS)
      Write(hup(NavBar()))
    end
    Route()
  end
end

LaunchBrowser()
