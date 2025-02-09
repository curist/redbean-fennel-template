local fennel = require("fennel")

fennel.path = fennel.path .. ";/zip/.lua/?.fnl"
fennel.path = fennel.path .. ";/zip/.lua/?/init.fnl"
fennel.path = fennel.path .. ";/zip/?.fnl"
fennel.path = fennel.path .. ";/zip/?/init.fnl"

fennel.install()
