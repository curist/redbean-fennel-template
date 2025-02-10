require("fennel-install")

local hup = require("hup")
local SakuraCSS = hup(require("components/SakuraCSS")())
local NavBar = require("components/NavBar")
local NotFoundPage = require("components/NotFoundPage")

HidePath("/usr/share")

local function renderPage(pages)
  local Page = pages[GetMethod()] or NotFoundPage
  Write(hup(Page()))
end

function OnHttpRequest()
  local p = GetPath()
  local found, pages
  if p:match(".fnl$") then
    found, pages = pcall(require, p:gsub(".fnl$", ""))
  elseif p:match("/$") then
    found, pages = pcall(require, p .. "index")
  end

  Write(SakuraCSS)
  Write(hup(NavBar()))

  if found then
    renderPage(pages)
  else
    Route()
  end
end

LaunchBrowser()
