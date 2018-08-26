#These are python directories from Homebrew:
#Be sure to change to your python installation

INCLUDE = /usr/local/cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/include/python3.7m/
LIBPATH = /usr/local/cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib 
LINK = python3.7 

BINPATH = /usr/local/bin
#Homebrew default install path

CFLAGS = -O3 -I$(INCLUDE) -L$(LIBPATH) -l$(LINK)

asciify: asciify.c
	cc asciify.c -o asciify $(CFLAGS)

asciify.c: asciify.py
	cython --embed -o asciify.c asciify.py
clean:
	rm -rf asciify.c
	rm -rf asciify

install: asciify
	cp asciify $(BINPATH)

uninstall: 
	rm -f $(BINPATH)/asciify
