CC=gcc
CCCFLAGS=-I./src/headers/ -o ./build/bman.o
CCFLAGS= -o ./build/bman -I./src/headers/
CCDBG= -g
CCOPT= -O2

default: release

setup:
	mkdir ./build

bman.o: setup src/bman.c
	$(CC) $(CCCFLAGS) -c src/bman.c

debug: bman.o
	$(CC) $(CCFLAGS) $(CCDBG) build/bman.o
	@echo "Make executed (DEBUG)"

release: bman.o
	$(CC) $(CCFLAGS) build/bman.o
	@echo "Make executed (RELEASE)"

opt: bman.o
	$(CC) $(CCFLAGS) $(CCOPT) build/bman.o
	@echo "Make executed (OPTIMIZED RELEASE)"

clean:
	@echo -n "rm build/bman.o"
	@-rm build/bman.o 2> /dev/null && ([ $$? -eq 0 ] && echo " | File removed") || echo " | File not found. Proceeding..."
	@echo -n "rm build/bman  "
	@-rm ./build/bman 2> /dev/null && ([ $$? -eq 0 ] && echo " | File removed") || echo " | File not found. Proceeding..."    
	@echo -n "rmdir build "
	@-rmdir ./build 2> /dev/null && ([ $$? -eq 0 ] && echo " | Directory removed") || echo " | Directory not found. Proceeding..."
	@echo "Cleanup complete"
