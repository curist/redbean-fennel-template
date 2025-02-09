.DEFAULT_GOAL := build

FENNEL_VERSION = 1.5.1

build: redbean.com

redbean.com: cp src/.lua/fennel.lua
	cd src && zip -r ../redbean.com .

src/.lua/fennel.lua:
	curl -o $@ https://fennel-lang.org/downloads/fennel-${FENNEL_VERSION}.lua

artifacts:
	mkdir -p $@

artifacts/redbean.version.txt: artifacts
	curl https://redbean.dev/latest.txt > $@

artifacts/redbean.dev.com: artifacts/redbean.version.txt
	curl -o $@ https://redbean.dev/redbean-$(shell cat $<).com

cp: artifacts/redbean.dev.com
	cp $< redbean.com
	chmod +x redbean.com

run: redbean.com
	./$<
