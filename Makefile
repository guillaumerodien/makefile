libarithmetique_library.a:
	gcc -fPIC -c -Wall addition.c
	gcc -fPIC -c -Wall soustraction.c
	gcc -fPIC -c -Wall multiplication.c
	gcc -fPIC -c -Wall division.c

	ar rcs libarithmetique_library.a addition.o soustraction.o multiplication.o division.o

libarithmetique_library.so.1.0.0: addition.o soustraction.o division.o multiplication.o	
	gcc -shared -fPIC -Wl,-soname,libarithmetique_library.so.1 -o libarithmetique_library.so.1.0.0 addition.o soustraction.o multiplication.o division.o -lc

	ln -sf libarithmetique_library.so.1.0.0 libarithmetique_library.so

	ln -sf libarithmetique_library.so.1.0.0 libarithmetique_library.so.1
prog: libarithmetique_library.a
	gcc -c -Wall main.c 

	gcc -o aritthmetique.static main.o -L. -l:libarithmetique_library.a

	gcc -o aritthmetique main.o -L. -larithmetique_library

	LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./aritthmetique
clean:
	rm *.o *arithmetique*
