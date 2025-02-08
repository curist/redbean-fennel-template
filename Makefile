build: cp
	zip redbean.com -r .lua
	zip redbean.com .init.lua *.html *.lua *.fnl

cp:
	cp redbean.dev.com redbean.com
	chmod +x redbean.com


run:
	./redbean.com
