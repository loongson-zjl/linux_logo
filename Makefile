##############################################################
#  Makefile for Linux Logo 1.06 -- by Vince Weaver           #
#                                                            #
#  To modify for your configuration, add or remove the #     #
#                                                            #
##############################################################

#Your compiler.  If gcc doesn't work, try CC
CC = gcc

#For Linux
PLATFORM = 'Linux'
C_OPTS = -O2 -Wall -DLINUX_ANSI 

#For Sgi
#PLATFORM = 'SGI'
#C_OPTS = -O2 -DIRIX_ANSI -DSGI

#For All Other Unixes
#PLATFORM = 'Default Unix'
#C_OPTS = -O2 

all:	linux_logo

clean:
	rm -f *.o
	rm -f linux_logo
	rm *~

install:	linux_logo
	cp linux_logo /usr/local/bin
	
linux_logo:	linux_logo.o getsysinfo.o bogomips.o
	$(CC) $(C_OPTS) -o linux_logo linux_logo.o getsysinfo.o bogomips.o $(L_OPTS)
	@strip linux_logo

linux_logo.o:	linux_logo.c ascii_penguin.h
	@echo Compiling for $(PLATFORM)
	@echo Edit the Makefile to change Platform
	$(CC) $(C_OPTS) -c linux_logo.c

getsysinfo.o:	getsysinfo.c
	$(CC) $(C_OPTS) -c getsysinfo.c

bogomips.o:	bogomips.c
	$(CC) $(C_OPTS) -c bogomips.c
