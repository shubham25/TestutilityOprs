SRCDIR      := src
BUILDDIR    := obj
TARGETDIR   := .
INCDIR      := inc
SRCEXT      := cpp
DEPEXT      := d
OBJEXT      := o
APP 		:= spi1553_app


# CXXFLAGS := #-Wall#-g
# CFLAGS 		:= 
CFLAGS 		:= -Wall
# CFLAGS 		:= -Wall -g
# CPPSRC := $(wildcard *.cpp) 
# CSRC  := $(wildcard *.c)
LIB 		:= -lpthread -lprussdrv
INC         := -I$(INCDIR)
INCDEP      := -I$(INCDIR)

#-------------------------------------------------------------------------------------------------------

PRUSRC 		:= $(shell find $(SRCDIR) -type f -name *.p)
PASMFLAGS 	:= -V3 -lb
CC 			:= g++

SOURCES     := $(shell find $(SRCDIR) -type f -name "*.$(SRCEXT)")
OBJECTS     := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.$(OBJEXT)))
DEPS 		:= $(OBJECTS:.$(OBJEXT)=.$(DEPEXT))

all: pru app

remake: cleanall all

# pru make rules
pru: $(SRCDIR)/global_pru1.h $(PRUSRC:.p=.h)
	pasm $(PASMFLAGS)  $(PRUSRC)

directories:
	@mkdir -p $(TARGETDIR)
	@mkdir -p $(BUILDDIR)

# test make $@.o
test: test/test.o 

.PHONY: clean cleanall

clean:
	rm -rf $(BUILDDIR)  

cleanall: clean
	rm -f *.bin  *.lst $(APP)


-include $(DEPS)

#generate deps
# sed ’s,\($*\)\.o[ :]*,\1.o $@ : ,g’ < $@.$$$$ > $@; 
# $(CC) $< -MM -MT $(@:.=.o) >$@
# $(BUILDDIR)/%.$(DEPEXT):  $(SRCDIR)/%.$(SRCEXT)
	# $(CC) -MM -MF $@ $< 

app: $(OBJECTS)
	$(CC) -o $(TARGETDIR)/$(APP) $^ $(LIB)


#Compile
$(BUILDDIR)/%.$(OBJEXT): $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INC) -c -o $@ $<
	@$(CC) $(CFLAGS) $(INCDEP) -MM $(SRCDIR)/$*.$(SRCEXT) > $(BUILDDIR)/$*.$(DEPEXT)
	@cp -f $(BUILDDIR)/$*.$(DEPEXT) $(BUILDDIR)/$*.$(DEPEXT).tmp
	@sed -e 's|.*:|$(BUILDDIR)/$*.$(OBJEXT):|' < $(BUILDDIR)/$*.$(DEPEXT).tmp > $(BUILDDIR)/$*.$(DEPEXT)
	@sed -e 's/.*://' -e 's/\\$$//' < $(BUILDDIR)/$*.$(DEPEXT).tmp | fmt -1 | sed -e 's/^ *//' -e 's/$$/:/' >> $(BUILDDIR)/$*.$(DEPEXT)
	@rm -f $(BUILDDIR)/$*.$(DEPEXT).tmp







