build: cp
	cd src && zip -r ../redbean.com .

cp:
	cp redbean.dev.com redbean.com
	chmod +x redbean.com

run:
	./redbean.com
