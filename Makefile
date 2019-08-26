# A template Makefile 
# Set Prog to the program's name
# unpack minilib to the "source dir/minilib"
# or set a link
# copy this Makefile into the source dir
# done.

# Or: download the file minilibcombined.c
# have a look in minilib.h, which defines you need
# define your switches, and include 
# minilibcombined.c into one of your sourcefiles.
# 



ifndef PROG
PROG=readkey
endif

# where to build object files (defaults to ./ )
BUILDDIR=.

# where should the binares go?
#BINDIR=./static_x64

# Where minilib is installed, or should be installed to
MLIBDIR=minilib

# Don't create obj files, include evrything in one gcc run.(yourself)
SINGLERUN=1

# Include everything yourself
NOINCLUDE=1

# include only the Text section in the resulting elf output
#ONLYTEXT=1

# Set the optimization flag (default: -O1)
#OPTFLAG=-O1

# GCC
#GCC=gcc

# LD
#LD=ld

# build and keep debug information. 
# also enables all macros like dbg, dbgwarn, and so on
#DEBUG=1

# strip binary
STRIP=1

# Truncate elf binaries
# more radically. Only linux. needs tools/shrinkelf
#SHRINKELF=1

# Report verbose 
#VERBOSE=1

# configsettings ending here

ifdef BUILDPROG
		PROG=$(BUILDPROG)
		include $(MLIBDIR)/Makefile.include
else

#( This is a recursive Makefile and will call itself with this param)
ifdef with-minilib
include $(MLIBDIR)/Makefile.include 
endif

#Compile with minilib or without
# Will compile with minilib, if present and found in MLIBDIR
default: 
	$(if $(wildcard $(MLIBDIR)/Makefile.include), make with-minilib=1, make readkey )


# build with mini-gcc script
readkey: readkey.c
	./mini-gcc --config readkey.mconf -o readkey readkey.c

# build without minilib
# compile with dynamic loading, os native libs
native: $(PROG).c
	$(info call "make getminilib" to fetch and extract the "minilib" and compile $(PROG) static (recommended) )
	gcc -o $(PROG) $(PROG).c


# we haven't been callen recursive
ifndef with-minilib

ifndef BUILDDIR
		BUILDDIR=.
endif

rebuild:
	make clean
	make

clean:
	$(shell rm $(PROG))
	$(shell cd $(BUILDDIR) && rm *.o)

endif

getminilib: $(MLIBDIR)/minilib.h

$(MLIBDIR)/minilib.h:
	$(info get minilib)
	git clone https://github.com/michael105/minilib.git $(MLIBDIR) || (( (curl https://codeload.github.com/michael105/minilib/zip/master > minilib.zip) || (wget https://codeload.github.com/michael105/minilib/zip/master)) && unzip minilib.zip && mv minilib-master $(MLIBDIR))
	make rebuild

install: $(PROG)
	cp $(PROG) /usr/local/bin


endif

#if 0
ifdef UNDEF

Copyright (c) 2012-2019 Michael (Misc) Myer, 
misc.myer@zoho.com / www.github.com/michael105


   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

endif
#endif

