local fennel = require("fennel")

fennel.path = fennel.path .. ";/zip/.fnl/?.fnl"
fennel.path = fennel.path .. ";/zip/.fnl/?/init.fnl"
fennel.path = fennel.path .. ";/zip/?.fnl"
fennel.path = fennel.path .. ";/zip/?/init.fnl"

fennel.install()
