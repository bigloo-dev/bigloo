#*=====================================================================*/
#*    .../prgm/project/bigloo/api/fthread/examples/gas/Makefile        */
#*    -------------------------------------------------------------    */
#*    Author      :  Manuel Serrano                                    */
#*    Creation    :  Mon Jan  7 14:55:33 2002                          */
#*    Last change :  Sun Jul  9 10:09:11 2017 (serrano)                */
#*    Copyright   :  2002-17 Manuel Serrano                            */
#*    -------------------------------------------------------------    */
#*    The Makefile to build the Fair threads tests                     */
#*=====================================================================*/

#*---------------------------------------------------------------------*/
#*    Standard path                                                    */
#*---------------------------------------------------------------------*/
include ../../../../Makefile.buildconfig 
include ../../../../Makefile.config 

#*---------------------------------------------------------------------*/
#*    Bigloo                                                           */
#*---------------------------------------------------------------------*/
BIGLOO		= bigloo
BFLAGS		= -unsafe -O3

#*---------------------------------------------------------------------*/
#*    Objects and sources                                              */
#*---------------------------------------------------------------------*/
SCM_FILE	= gas

#*---------------------------------------------------------------------*/
#*    All objects and sources                                          */
#*---------------------------------------------------------------------*/
POPULATION	= gas.scm Makefile

#*---------------------------------------------------------------------*/
#*    the goals.                                                       */
#*---------------------------------------------------------------------*/
all: gas.jvm gas.out

c: gas.out
gas.out: gas.o
	$(BIGLOO) $(BFLAGS) gas.o -o gas.out

jvm: gas.jvm
gas.jvm: gas.class
	$(BIGLOO) -jvm $(BFLAGS) gas.class -o gas.jvm

pop:
	@ echo $(POPULATION:%=fthread/examples/gas/%)

clean:
	@- $(RM) -f *~ '#*#' core
	@- $(RM) -f *.escm *.ast a.out gas.c
	@- $(RM) -f *.o
	@- $(RM) -f JVMMAIN.class *.class
	@- $(RM) -f gas.out gas.jvm

#*---------------------------------------------------------------------*/
#*    Test                                                             */
#*---------------------------------------------------------------------*/
test: test-c test-jvm

test-c:
	(export LD_LIBRARY_PATH=../lib:$$LD_LIBRARY_PATH; ./gas.out)

test-jvm:
	./gas.jvm

#*---------------------------------------------------------------------*/
#*    Suffixes                                                         */
#*---------------------------------------------------------------------*/
.SUFFIXES:
.SUFFIXES: .bgl .scm .o .class

#*---------------------------------------------------------------------*/
#*    .scm.o                                                           */
#*---------------------------------------------------------------------*/
.scm.o: $*.scm
	$(BIGLOO) -c $(BFLAGS) $*.scm -o $*.o

.scm.class: $*.scm
	$(BIGLOO) -c -jvm $(BFLAGS) $*.scm -o $*.class

