CC = gcc
CFLAGS = -Wall -fPIC
FILES = addition.o soustraction.o division.o multiplication.o 
LINKNAME = arithmetique
LIBSTATIC =lib$(LINKNAME).a
LIBDYNA = lib$(LINKNAME).so
STATIC = $(LINKNAME).static
DYNA = $(LINKNAME).dyna
LIBNAME = library
LIB = LIBRARY
SO =.so

$(FILES):

$(LIBDYNA): main.o $(FILES)
	$(CC) -shared -fPIC -Wl,-soname,lib$(LINKNAME)_$(LIBNAME)$(SO).1 -o lib$(LINKNAME)_$(LIBNAME)$(SO).1.0.0 $^ -lc
	ln -sf $@.1.0.0 $@
	ln -sf $@.1.0.0 $@.1
	$(CC) -o $(LINKNAME) main.o -L. -l$(LINKNAME)_$(LIBNAME)
	LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./$(LINKNAME)

$(LIBSTATIC): main.o $(FILES)
	ar rcs lib$(LINKNAME)_$(LIBNAME).a $^
	$(CC) -o $(LINKNAME).static main.o -L. -l:lib$(LINKNAME)_$(LIBNAME).a
	LD_$(LIB)_PATH=.:$LD_$(LIB)_PATH ./$@
	
clean:
	rm *.o *$(LINKNAME)*
