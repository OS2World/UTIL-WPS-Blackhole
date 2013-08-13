#--------------------------------------------
# Simplified makefile
#--------------------------------------------
#--------------------------------------------
# Include inference rules and definitions
#--------------------------------------------
!include makedefs.inc

.c.obj:
#        $(CCDLL) -I$(HPATH) $*.c 1> $*.err
        $(CCDLL) -I$(HPATH) $*.c 
#        @TYPE $*.err
        @ECHO No Fatal Error for $*.c

.csc.ih:
        sc -v -r $*.csc

#--------------------------------------------
# Define suffixes
#--------------------------------------------
.SUFFIXES:
.SUFFIXES: .c .obj .dll .csc .sc .h .ih .ph .psc .rc .res .dlg

#--------------------------------------------
#  Environment Setup for the component(s).
#--------------------------------------------
SCPATH=D:\TOOLKT20\SC
HPATH=D:\TOOLKT20\c\os2h
LIBPATH=D:\TOOLKT20\os2lib

#--------------------------------------------
# Compiler/tools Macros
#--------------------------------------------
LINK    = LINK386


#--------------------------------------------
# List all objects for app
#--------------------------------------------
DLLOBJS = BlackHol.obj 

#--------------------------------------------
# Make entry point
#--------------------------------------------
all: BlackHol.ih BlackHol.dll 

BlackHol.ih:  $$(@B).csc

BlackHol.obj: $$(@B).c $$(@B).ih $$(@B).h  $$(@B).sc

BlackHol.dll: $$(@B).def $(DLLOBJS) 
          $(LINK) $(LFLAGS) $(DLLOBJS),$@,$*.Map,$(DEFLIBS),$*.def; > $*.erl
