
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

TestRelease_tag = $(tag)

ifdef READONLY
cmt_local_tagfile = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
else
#cmt_local_tagfile = $(TestRelease_tag).make
cmt_local_tagfile = $(bin)$(TestRelease_tag).make
endif

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

ifdef READONLY
cmt_local_setup = /tmp/CMT_TestReleasesetup$(cmt_lock_pid).make
cmt_final_setup = /tmp/CMT_TestReleasesetup.make
else
#cmt_local_setup = $(bin)TestReleasesetup$(cmt_lock_pid).make
cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)TestReleasesetup.make
cmt_final_setup = $(bin)$(package)setup.make
endif

#--------------------------------------------------------

#cmt_lock_setup = /tmp/lock$(cmt_lock_pid).make
#cmt_temp_tag = /tmp/tag$(cmt_lock_pid).make

#first :: $(cmt_local_tagfile)
#	@echo $(cmt_local_tagfile) ok
ifndef QUICK
first :: $(cmt_final_setup) ;
else
first :: ;
endif

##	@bin=`$(cmtexe) show macro_value bin`

#$(cmt_local_tagfile) : $(cmt_lock_setup)
#	@echo "#CMT> Error: $@: No such file" >&2; exit 1
$(cmt_local_tagfile) :
	@echo "#CMT> Warning: $@: No such file" >&2; exit
#	@echo "#CMT> Info: $@: No need to rebuild file" >&2; exit

$(cmt_final_setup) : $(cmt_local_tagfile) 
	$(echo) "(constituents.make) Rebuilding $@"
	@if test ! -d $(@D); then $(mkdir) -p $(@D); fi; \
	  if test -f $(cmt_local_setup); then /bin/rm -f $(cmt_local_setup); fi; \
	  trap '/bin/rm -f $(cmt_local_setup)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) show setup >>$(cmt_local_setup); \
	  if test ! -f $@; then \
	    mv $(cmt_local_setup) $@; \
	  else \
	    if /usr/bin/diff $(cmt_local_setup) $@ >/dev/null ; then \
	      : ; \
	    else \
	      mv $(cmt_local_setup) $@; \
	    fi; \
	  fi

#	@/bin/echo $@ ok   

config :: checkuses
	@exit 0
checkuses : ;

env.make ::
	printenv >env.make.tmp; $(cmtexe) check files env.make.tmp env.make

ifndef QUICK
all :: build_library_links
	$(echo) "(constituents.make) all done"
endif

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

build_library_links : dirs requirements
	$(echo) "(constituents.make) Rebuilding library links"; \
	if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi; \
	$(build_library_links)

.DEFAULT ::
	$(echo) "(constituents.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: Using default commands" >&2; exit

#	@if test "$@" = "$(cmt_lock_setup)"; then \
	#  /bin/rm -f $(cmt_lock_setup); \
	 # touch $(cmt_lock_setup); \
	#fi

#-- end of constituents_header ------
#-- start of group ------

all_groups :: all

all :: $(all_dependencies)  $(all_pre_constituents) $(all_constituents)  $(all_post_constituents)
	$(echo) "all ok."

#	@/bin/echo " all ok."

clean :: allclean

allclean ::  $(all_constituentsclean)
	$(echo) $(all_constituentsclean)
	$(echo) "allclean ok."

#	@echo $(all_constituentsclean)
#	@/bin/echo " allclean ok."

allclean :: makefilesclean

#-- end of group ------
#-- start of group ------

all_groups :: cmt_actions

cmt_actions :: $(cmt_actions_dependencies)  $(cmt_actions_pre_constituents) $(cmt_actions_constituents)  $(cmt_actions_post_constituents)
	$(echo) "cmt_actions ok."

#	@/bin/echo " cmt_actions ok."

clean :: allclean

cmt_actionsclean ::  $(cmt_actions_constituentsclean)
	$(echo) $(cmt_actions_constituentsclean)
	$(echo) "cmt_actionsclean ok."

#	@echo $(cmt_actions_constituentsclean)
#	@/bin/echo " cmt_actionsclean ok."

cmt_actionsclean :: makefilesclean

#-- end of group ------
#-- start of constituent_lock ------

cmt_config_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_config_has_target_tag

ifdef READONLY
cmt_local_tagfile_config = /tmp/CMT_$(TestRelease_tag)_config.make$(cmt_lock_pid)
cmt_final_setup_config = /tmp/CMT_TestRelease_configsetup.make
cmt_local_config_makefile = /tmp/CMT_config$(cmt_lock_pid).make
else
#cmt_local_tagfile_config = $(TestRelease_tag)_config.make
cmt_local_tagfile_config = $(bin)$(TestRelease_tag)_config.make
cmt_final_setup_config = $(bin)TestRelease_configsetup.make
cmt_local_config_makefile = $(bin)config.make
endif

config_extratags = -tag_add=target_config

#$(cmt_local_tagfile_config) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_config) ::
else
$(cmt_local_tagfile_config) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_config)"
	@if test -f $(cmt_local_tagfile_config); then /bin/rm -f $(cmt_local_tagfile_config); fi ; \
	  $(cmtexe) -tag=$(tags) $(config_extratags) build tag_makefile >>$(cmt_local_tagfile_config); \
	  if test -f $(cmt_final_setup_config); then /bin/rm -f $(cmt_final_setup_config); fi; \
	  $(cmtexe) -tag=$(tags) $(config_extratags) show setup >>$(cmt_final_setup_config)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_config = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_config = /tmp/CMT_TestReleasesetup.make
cmt_local_config_makefile = /tmp/CMT_config$(cmt_lock_pid).make
else
#cmt_local_tagfile_config = $(TestRelease_tag).make
cmt_local_tagfile_config = $(bin)$(TestRelease_tag).make
cmt_final_setup_config = $(bin)TestReleasesetup.make
cmt_local_config_makefile = $(bin)config.make
endif

endif

ifndef QUICK
$(cmt_local_config_makefile) :: $(config_dependencies) $(cmt_local_tagfile_config) build_library_links dirs
else
$(cmt_local_config_makefile) :: $(cmt_local_tagfile_config)
endif
	$(echo) "(constituents.make) Building config.make"; \
	  $(cmtexe) -tag=$(tags) $(config_extratags) build constituent_makefile -out=$(cmt_local_config_makefile) config

config :: $(config_dependencies) $(cmt_local_config_makefile)
	$(echo) "(constituents.make) Creating config${lock_suffix} and Starting config"
	@${lock_command} config${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} config${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_config_makefile) cmt_lock_pid=$${cmt_lock_pid} config; \
	  retval=$$?; ${unlock_command} config${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) config done"

clean :: configclean

configclean :: $(configclean_dependencies) ##$(cmt_local_config_makefile)
	$(echo) "(constituents.make) Starting configclean"
	@-if test -f $(cmt_local_config_makefile); then \
	  $(MAKE) -f $(cmt_local_config_makefile) cmt_lock_pid=$${cmt_lock_pid} configclean; \
	fi

##	  /bin/rm -f $(cmt_local_config_makefile) $(bin)config_dependencies.make

install :: configinstall

configinstall :: $(config_dependencies) $(cmt_local_config_makefile)
	$(echo) "(constituents.make) Starting install config"
	@-$(MAKE) -f $(cmt_local_config_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install config done"

uninstall :: configuninstall

configuninstall :: $(cmt_local_config_makefile)
	$(echo) "(constituents.make) Starting uninstall config"
	@-$(MAKE) -f $(cmt_local_config_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall config done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ config"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ config done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_install_includes_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_includes_has_target_tag

ifdef READONLY
cmt_local_tagfile_install_includes = /tmp/CMT_$(TestRelease_tag)_install_includes.make$(cmt_lock_pid)
cmt_final_setup_install_includes = /tmp/CMT_TestRelease_install_includessetup.make
cmt_local_install_includes_makefile = /tmp/CMT_install_includes$(cmt_lock_pid).make
else
#cmt_local_tagfile_install_includes = $(TestRelease_tag)_install_includes.make
cmt_local_tagfile_install_includes = $(bin)$(TestRelease_tag)_install_includes.make
cmt_final_setup_install_includes = $(bin)TestRelease_install_includessetup.make
cmt_local_install_includes_makefile = $(bin)install_includes.make
endif

install_includes_extratags = -tag_add=target_install_includes

#$(cmt_local_tagfile_install_includes) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_install_includes) ::
else
$(cmt_local_tagfile_install_includes) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_install_includes)"
	@if test -f $(cmt_local_tagfile_install_includes); then /bin/rm -f $(cmt_local_tagfile_install_includes); fi ; \
	  $(cmtexe) -tag=$(tags) $(install_includes_extratags) build tag_makefile >>$(cmt_local_tagfile_install_includes); \
	  if test -f $(cmt_final_setup_install_includes); then /bin/rm -f $(cmt_final_setup_install_includes); fi; \
	  $(cmtexe) -tag=$(tags) $(install_includes_extratags) show setup >>$(cmt_final_setup_install_includes)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_install_includes = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_install_includes = /tmp/CMT_TestReleasesetup.make
cmt_local_install_includes_makefile = /tmp/CMT_install_includes$(cmt_lock_pid).make
else
#cmt_local_tagfile_install_includes = $(TestRelease_tag).make
cmt_local_tagfile_install_includes = $(bin)$(TestRelease_tag).make
cmt_final_setup_install_includes = $(bin)TestReleasesetup.make
cmt_local_install_includes_makefile = $(bin)install_includes.make
endif

endif

ifndef QUICK
$(cmt_local_install_includes_makefile) :: $(install_includes_dependencies) $(cmt_local_tagfile_install_includes) build_library_links dirs
else
$(cmt_local_install_includes_makefile) :: $(cmt_local_tagfile_install_includes)
endif
	$(echo) "(constituents.make) Building install_includes.make"; \
	  $(cmtexe) -tag=$(tags) $(install_includes_extratags) build constituent_makefile -out=$(cmt_local_install_includes_makefile) install_includes

install_includes :: $(install_includes_dependencies) $(cmt_local_install_includes_makefile)
	$(echo) "(constituents.make) Creating install_includes${lock_suffix} and Starting install_includes"
	@${lock_command} install_includes${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} install_includes${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_install_includes_makefile) cmt_lock_pid=$${cmt_lock_pid} install_includes; \
	  retval=$$?; ${unlock_command} install_includes${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) install_includes done"

clean :: install_includesclean

install_includesclean :: $(install_includesclean_dependencies) ##$(cmt_local_install_includes_makefile)
	$(echo) "(constituents.make) Starting install_includesclean"
	@-if test -f $(cmt_local_install_includes_makefile); then \
	  $(MAKE) -f $(cmt_local_install_includes_makefile) cmt_lock_pid=$${cmt_lock_pid} install_includesclean; \
	fi

##	  /bin/rm -f $(cmt_local_install_includes_makefile) $(bin)install_includes_dependencies.make

install :: install_includesinstall

install_includesinstall :: $(install_includes_dependencies) $(cmt_local_install_includes_makefile)
	$(echo) "(constituents.make) Starting install install_includes"
	@-$(MAKE) -f $(cmt_local_install_includes_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install install_includes done"

uninstall :: install_includesuninstall

install_includesuninstall :: $(cmt_local_install_includes_makefile)
	$(echo) "(constituents.make) Starting uninstall install_includes"
	@-$(MAKE) -f $(cmt_local_install_includes_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall install_includes done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ install_includes"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ install_includes done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_make_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_make_has_target_tag

ifdef READONLY
cmt_local_tagfile_make = /tmp/CMT_$(TestRelease_tag)_make.make$(cmt_lock_pid)
cmt_final_setup_make = /tmp/CMT_TestRelease_makesetup.make
cmt_local_make_makefile = /tmp/CMT_make$(cmt_lock_pid).make
else
#cmt_local_tagfile_make = $(TestRelease_tag)_make.make
cmt_local_tagfile_make = $(bin)$(TestRelease_tag)_make.make
cmt_final_setup_make = $(bin)TestRelease_makesetup.make
cmt_local_make_makefile = $(bin)make.make
endif

make_extratags = -tag_add=target_make

#$(cmt_local_tagfile_make) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_make) ::
else
$(cmt_local_tagfile_make) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_make)"
	@if test -f $(cmt_local_tagfile_make); then /bin/rm -f $(cmt_local_tagfile_make); fi ; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build tag_makefile >>$(cmt_local_tagfile_make); \
	  if test -f $(cmt_final_setup_make); then /bin/rm -f $(cmt_final_setup_make); fi; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) show setup >>$(cmt_final_setup_make)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_make = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_make = /tmp/CMT_TestReleasesetup.make
cmt_local_make_makefile = /tmp/CMT_make$(cmt_lock_pid).make
else
#cmt_local_tagfile_make = $(TestRelease_tag).make
cmt_local_tagfile_make = $(bin)$(TestRelease_tag).make
cmt_final_setup_make = $(bin)TestReleasesetup.make
cmt_local_make_makefile = $(bin)make.make
endif

endif

ifndef QUICK
$(cmt_local_make_makefile) :: $(make_dependencies) $(cmt_local_tagfile_make) build_library_links dirs
else
$(cmt_local_make_makefile) :: $(cmt_local_tagfile_make)
endif
	$(echo) "(constituents.make) Building make.make"; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build constituent_makefile -out=$(cmt_local_make_makefile) make

make :: $(make_dependencies) $(cmt_local_make_makefile)
	$(echo) "(constituents.make) Creating make${lock_suffix} and Starting make"
	@${lock_command} make${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} make${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_make_makefile) cmt_lock_pid=$${cmt_lock_pid} make; \
	  retval=$$?; ${unlock_command} make${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) make done"

clean :: makeclean

makeclean :: $(makeclean_dependencies) ##$(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting makeclean"
	@-if test -f $(cmt_local_make_makefile); then \
	  $(MAKE) -f $(cmt_local_make_makefile) cmt_lock_pid=$${cmt_lock_pid} makeclean; \
	fi

##	  /bin/rm -f $(cmt_local_make_makefile) $(bin)make_dependencies.make

install :: makeinstall

makeinstall :: $(make_dependencies) $(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting install make"
	@-$(MAKE) -f $(cmt_local_make_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install make done"

uninstall :: makeuninstall

makeuninstall :: $(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting uninstall make"
	@-$(MAKE) -f $(cmt_local_make_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall make done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ make"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ make done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_CompilePython_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_CompilePython_has_target_tag

ifdef READONLY
cmt_local_tagfile_CompilePython = /tmp/CMT_$(TestRelease_tag)_CompilePython.make$(cmt_lock_pid)
cmt_final_setup_CompilePython = /tmp/CMT_TestRelease_CompilePythonsetup.make
cmt_local_CompilePython_makefile = /tmp/CMT_CompilePython$(cmt_lock_pid).make
else
#cmt_local_tagfile_CompilePython = $(TestRelease_tag)_CompilePython.make
cmt_local_tagfile_CompilePython = $(bin)$(TestRelease_tag)_CompilePython.make
cmt_final_setup_CompilePython = $(bin)TestRelease_CompilePythonsetup.make
cmt_local_CompilePython_makefile = $(bin)CompilePython.make
endif

CompilePython_extratags = -tag_add=target_CompilePython

#$(cmt_local_tagfile_CompilePython) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_CompilePython) ::
else
$(cmt_local_tagfile_CompilePython) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_CompilePython)"
	@if test -f $(cmt_local_tagfile_CompilePython); then /bin/rm -f $(cmt_local_tagfile_CompilePython); fi ; \
	  $(cmtexe) -tag=$(tags) $(CompilePython_extratags) build tag_makefile >>$(cmt_local_tagfile_CompilePython); \
	  if test -f $(cmt_final_setup_CompilePython); then /bin/rm -f $(cmt_final_setup_CompilePython); fi; \
	  $(cmtexe) -tag=$(tags) $(CompilePython_extratags) show setup >>$(cmt_final_setup_CompilePython)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_CompilePython = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_CompilePython = /tmp/CMT_TestReleasesetup.make
cmt_local_CompilePython_makefile = /tmp/CMT_CompilePython$(cmt_lock_pid).make
else
#cmt_local_tagfile_CompilePython = $(TestRelease_tag).make
cmt_local_tagfile_CompilePython = $(bin)$(TestRelease_tag).make
cmt_final_setup_CompilePython = $(bin)TestReleasesetup.make
cmt_local_CompilePython_makefile = $(bin)CompilePython.make
endif

endif

ifndef QUICK
$(cmt_local_CompilePython_makefile) :: $(CompilePython_dependencies) $(cmt_local_tagfile_CompilePython) build_library_links dirs
else
$(cmt_local_CompilePython_makefile) :: $(cmt_local_tagfile_CompilePython)
endif
	$(echo) "(constituents.make) Building CompilePython.make"; \
	  $(cmtexe) -tag=$(tags) $(CompilePython_extratags) build constituent_makefile -out=$(cmt_local_CompilePython_makefile) CompilePython

CompilePython :: $(CompilePython_dependencies) $(cmt_local_CompilePython_makefile)
	$(echo) "(constituents.make) Creating CompilePython${lock_suffix} and Starting CompilePython"
	@${lock_command} CompilePython${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} CompilePython${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_CompilePython_makefile) cmt_lock_pid=$${cmt_lock_pid} CompilePython; \
	  retval=$$?; ${unlock_command} CompilePython${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) CompilePython done"

clean :: CompilePythonclean

CompilePythonclean :: $(CompilePythonclean_dependencies) ##$(cmt_local_CompilePython_makefile)
	$(echo) "(constituents.make) Starting CompilePythonclean"
	@-if test -f $(cmt_local_CompilePython_makefile); then \
	  $(MAKE) -f $(cmt_local_CompilePython_makefile) cmt_lock_pid=$${cmt_lock_pid} CompilePythonclean; \
	fi

##	  /bin/rm -f $(cmt_local_CompilePython_makefile) $(bin)CompilePython_dependencies.make

install :: CompilePythoninstall

CompilePythoninstall :: $(CompilePython_dependencies) $(cmt_local_CompilePython_makefile)
	$(echo) "(constituents.make) Starting install CompilePython"
	@-$(MAKE) -f $(cmt_local_CompilePython_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install CompilePython done"

uninstall :: CompilePythonuninstall

CompilePythonuninstall :: $(cmt_local_CompilePython_makefile)
	$(echo) "(constituents.make) Starting uninstall CompilePython"
	@-$(MAKE) -f $(cmt_local_CompilePython_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall CompilePython done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ CompilePython"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ CompilePython done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_qmtest_run_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_qmtest_run_has_target_tag

ifdef READONLY
cmt_local_tagfile_qmtest_run = /tmp/CMT_$(TestRelease_tag)_qmtest_run.make$(cmt_lock_pid)
cmt_final_setup_qmtest_run = /tmp/CMT_TestRelease_qmtest_runsetup.make
cmt_local_qmtest_run_makefile = /tmp/CMT_qmtest_run$(cmt_lock_pid).make
else
#cmt_local_tagfile_qmtest_run = $(TestRelease_tag)_qmtest_run.make
cmt_local_tagfile_qmtest_run = $(bin)$(TestRelease_tag)_qmtest_run.make
cmt_final_setup_qmtest_run = $(bin)TestRelease_qmtest_runsetup.make
cmt_local_qmtest_run_makefile = $(bin)qmtest_run.make
endif

qmtest_run_extratags = -tag_add=target_qmtest_run

#$(cmt_local_tagfile_qmtest_run) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_qmtest_run) ::
else
$(cmt_local_tagfile_qmtest_run) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_qmtest_run)"
	@if test -f $(cmt_local_tagfile_qmtest_run); then /bin/rm -f $(cmt_local_tagfile_qmtest_run); fi ; \
	  $(cmtexe) -tag=$(tags) $(qmtest_run_extratags) build tag_makefile >>$(cmt_local_tagfile_qmtest_run); \
	  if test -f $(cmt_final_setup_qmtest_run); then /bin/rm -f $(cmt_final_setup_qmtest_run); fi; \
	  $(cmtexe) -tag=$(tags) $(qmtest_run_extratags) show setup >>$(cmt_final_setup_qmtest_run)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_qmtest_run = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_qmtest_run = /tmp/CMT_TestReleasesetup.make
cmt_local_qmtest_run_makefile = /tmp/CMT_qmtest_run$(cmt_lock_pid).make
else
#cmt_local_tagfile_qmtest_run = $(TestRelease_tag).make
cmt_local_tagfile_qmtest_run = $(bin)$(TestRelease_tag).make
cmt_final_setup_qmtest_run = $(bin)TestReleasesetup.make
cmt_local_qmtest_run_makefile = $(bin)qmtest_run.make
endif

endif

ifndef QUICK
$(cmt_local_qmtest_run_makefile) :: $(qmtest_run_dependencies) $(cmt_local_tagfile_qmtest_run) build_library_links dirs
else
$(cmt_local_qmtest_run_makefile) :: $(cmt_local_tagfile_qmtest_run)
endif
	$(echo) "(constituents.make) Building qmtest_run.make"; \
	  $(cmtexe) -tag=$(tags) $(qmtest_run_extratags) build constituent_makefile -out=$(cmt_local_qmtest_run_makefile) qmtest_run

qmtest_run :: $(qmtest_run_dependencies) $(cmt_local_qmtest_run_makefile)
	$(echo) "(constituents.make) Creating qmtest_run${lock_suffix} and Starting qmtest_run"
	@${lock_command} qmtest_run${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} qmtest_run${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_qmtest_run_makefile) cmt_lock_pid=$${cmt_lock_pid} qmtest_run; \
	  retval=$$?; ${unlock_command} qmtest_run${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) qmtest_run done"

clean :: qmtest_runclean

qmtest_runclean :: $(qmtest_runclean_dependencies) ##$(cmt_local_qmtest_run_makefile)
	$(echo) "(constituents.make) Starting qmtest_runclean"
	@-if test -f $(cmt_local_qmtest_run_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_run_makefile) cmt_lock_pid=$${cmt_lock_pid} qmtest_runclean; \
	fi

##	  /bin/rm -f $(cmt_local_qmtest_run_makefile) $(bin)qmtest_run_dependencies.make

install :: qmtest_runinstall

qmtest_runinstall :: $(qmtest_run_dependencies) $(cmt_local_qmtest_run_makefile)
	$(echo) "(constituents.make) Starting install qmtest_run"
	@-$(MAKE) -f $(cmt_local_qmtest_run_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install qmtest_run done"

uninstall :: qmtest_rununinstall

qmtest_rununinstall :: $(cmt_local_qmtest_run_makefile)
	$(echo) "(constituents.make) Starting uninstall qmtest_run"
	@-$(MAKE) -f $(cmt_local_qmtest_run_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall qmtest_run done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ qmtest_run"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ qmtest_run done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_qmtest_summarize_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_qmtest_summarize_has_target_tag

ifdef READONLY
cmt_local_tagfile_qmtest_summarize = /tmp/CMT_$(TestRelease_tag)_qmtest_summarize.make$(cmt_lock_pid)
cmt_final_setup_qmtest_summarize = /tmp/CMT_TestRelease_qmtest_summarizesetup.make
cmt_local_qmtest_summarize_makefile = /tmp/CMT_qmtest_summarize$(cmt_lock_pid).make
else
#cmt_local_tagfile_qmtest_summarize = $(TestRelease_tag)_qmtest_summarize.make
cmt_local_tagfile_qmtest_summarize = $(bin)$(TestRelease_tag)_qmtest_summarize.make
cmt_final_setup_qmtest_summarize = $(bin)TestRelease_qmtest_summarizesetup.make
cmt_local_qmtest_summarize_makefile = $(bin)qmtest_summarize.make
endif

qmtest_summarize_extratags = -tag_add=target_qmtest_summarize

#$(cmt_local_tagfile_qmtest_summarize) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_qmtest_summarize) ::
else
$(cmt_local_tagfile_qmtest_summarize) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_qmtest_summarize)"
	@if test -f $(cmt_local_tagfile_qmtest_summarize); then /bin/rm -f $(cmt_local_tagfile_qmtest_summarize); fi ; \
	  $(cmtexe) -tag=$(tags) $(qmtest_summarize_extratags) build tag_makefile >>$(cmt_local_tagfile_qmtest_summarize); \
	  if test -f $(cmt_final_setup_qmtest_summarize); then /bin/rm -f $(cmt_final_setup_qmtest_summarize); fi; \
	  $(cmtexe) -tag=$(tags) $(qmtest_summarize_extratags) show setup >>$(cmt_final_setup_qmtest_summarize)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_qmtest_summarize = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_qmtest_summarize = /tmp/CMT_TestReleasesetup.make
cmt_local_qmtest_summarize_makefile = /tmp/CMT_qmtest_summarize$(cmt_lock_pid).make
else
#cmt_local_tagfile_qmtest_summarize = $(TestRelease_tag).make
cmt_local_tagfile_qmtest_summarize = $(bin)$(TestRelease_tag).make
cmt_final_setup_qmtest_summarize = $(bin)TestReleasesetup.make
cmt_local_qmtest_summarize_makefile = $(bin)qmtest_summarize.make
endif

endif

ifndef QUICK
$(cmt_local_qmtest_summarize_makefile) :: $(qmtest_summarize_dependencies) $(cmt_local_tagfile_qmtest_summarize) build_library_links dirs
else
$(cmt_local_qmtest_summarize_makefile) :: $(cmt_local_tagfile_qmtest_summarize)
endif
	$(echo) "(constituents.make) Building qmtest_summarize.make"; \
	  $(cmtexe) -tag=$(tags) $(qmtest_summarize_extratags) build constituent_makefile -out=$(cmt_local_qmtest_summarize_makefile) qmtest_summarize

qmtest_summarize :: $(qmtest_summarize_dependencies) $(cmt_local_qmtest_summarize_makefile)
	$(echo) "(constituents.make) Creating qmtest_summarize${lock_suffix} and Starting qmtest_summarize"
	@${lock_command} qmtest_summarize${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} qmtest_summarize${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_qmtest_summarize_makefile) cmt_lock_pid=$${cmt_lock_pid} qmtest_summarize; \
	  retval=$$?; ${unlock_command} qmtest_summarize${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) qmtest_summarize done"

clean :: qmtest_summarizeclean

qmtest_summarizeclean :: $(qmtest_summarizeclean_dependencies) ##$(cmt_local_qmtest_summarize_makefile)
	$(echo) "(constituents.make) Starting qmtest_summarizeclean"
	@-if test -f $(cmt_local_qmtest_summarize_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_summarize_makefile) cmt_lock_pid=$${cmt_lock_pid} qmtest_summarizeclean; \
	fi

##	  /bin/rm -f $(cmt_local_qmtest_summarize_makefile) $(bin)qmtest_summarize_dependencies.make

install :: qmtest_summarizeinstall

qmtest_summarizeinstall :: $(qmtest_summarize_dependencies) $(cmt_local_qmtest_summarize_makefile)
	$(echo) "(constituents.make) Starting install qmtest_summarize"
	@-$(MAKE) -f $(cmt_local_qmtest_summarize_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install qmtest_summarize done"

uninstall :: qmtest_summarizeuninstall

qmtest_summarizeuninstall :: $(cmt_local_qmtest_summarize_makefile)
	$(echo) "(constituents.make) Starting uninstall qmtest_summarize"
	@-$(MAKE) -f $(cmt_local_qmtest_summarize_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall qmtest_summarize done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ qmtest_summarize"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ qmtest_summarize done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TestPackage_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TestPackage_has_target_tag

ifdef READONLY
cmt_local_tagfile_TestPackage = /tmp/CMT_$(TestRelease_tag)_TestPackage.make$(cmt_lock_pid)
cmt_final_setup_TestPackage = /tmp/CMT_TestRelease_TestPackagesetup.make
cmt_local_TestPackage_makefile = /tmp/CMT_TestPackage$(cmt_lock_pid).make
else
#cmt_local_tagfile_TestPackage = $(TestRelease_tag)_TestPackage.make
cmt_local_tagfile_TestPackage = $(bin)$(TestRelease_tag)_TestPackage.make
cmt_final_setup_TestPackage = $(bin)TestRelease_TestPackagesetup.make
cmt_local_TestPackage_makefile = $(bin)TestPackage.make
endif

TestPackage_extratags = -tag_add=target_TestPackage

#$(cmt_local_tagfile_TestPackage) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TestPackage) ::
else
$(cmt_local_tagfile_TestPackage) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_TestPackage)"
	@if test -f $(cmt_local_tagfile_TestPackage); then /bin/rm -f $(cmt_local_tagfile_TestPackage); fi ; \
	  $(cmtexe) -tag=$(tags) $(TestPackage_extratags) build tag_makefile >>$(cmt_local_tagfile_TestPackage); \
	  if test -f $(cmt_final_setup_TestPackage); then /bin/rm -f $(cmt_final_setup_TestPackage); fi; \
	  $(cmtexe) -tag=$(tags) $(TestPackage_extratags) show setup >>$(cmt_final_setup_TestPackage)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_TestPackage = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_TestPackage = /tmp/CMT_TestReleasesetup.make
cmt_local_TestPackage_makefile = /tmp/CMT_TestPackage$(cmt_lock_pid).make
else
#cmt_local_tagfile_TestPackage = $(TestRelease_tag).make
cmt_local_tagfile_TestPackage = $(bin)$(TestRelease_tag).make
cmt_final_setup_TestPackage = $(bin)TestReleasesetup.make
cmt_local_TestPackage_makefile = $(bin)TestPackage.make
endif

endif

ifndef QUICK
$(cmt_local_TestPackage_makefile) :: $(TestPackage_dependencies) $(cmt_local_tagfile_TestPackage) build_library_links dirs
else
$(cmt_local_TestPackage_makefile) :: $(cmt_local_tagfile_TestPackage)
endif
	$(echo) "(constituents.make) Building TestPackage.make"; \
	  $(cmtexe) -tag=$(tags) $(TestPackage_extratags) build constituent_makefile -out=$(cmt_local_TestPackage_makefile) TestPackage

TestPackage :: $(TestPackage_dependencies) $(cmt_local_TestPackage_makefile)
	$(echo) "(constituents.make) Creating TestPackage${lock_suffix} and Starting TestPackage"
	@${lock_command} TestPackage${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TestPackage${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TestPackage_makefile) cmt_lock_pid=$${cmt_lock_pid} TestPackage; \
	  retval=$$?; ${unlock_command} TestPackage${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TestPackage done"

clean :: TestPackageclean

TestPackageclean :: $(TestPackageclean_dependencies) ##$(cmt_local_TestPackage_makefile)
	$(echo) "(constituents.make) Starting TestPackageclean"
	@-if test -f $(cmt_local_TestPackage_makefile); then \
	  $(MAKE) -f $(cmt_local_TestPackage_makefile) cmt_lock_pid=$${cmt_lock_pid} TestPackageclean; \
	fi

##	  /bin/rm -f $(cmt_local_TestPackage_makefile) $(bin)TestPackage_dependencies.make

install :: TestPackageinstall

TestPackageinstall :: $(TestPackage_dependencies) $(cmt_local_TestPackage_makefile)
	$(echo) "(constituents.make) Starting install TestPackage"
	@-$(MAKE) -f $(cmt_local_TestPackage_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install TestPackage done"

uninstall :: TestPackageuninstall

TestPackageuninstall :: $(cmt_local_TestPackage_makefile)
	$(echo) "(constituents.make) Starting uninstall TestPackage"
	@-$(MAKE) -f $(cmt_local_TestPackage_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall TestPackage done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TestPackage"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TestPackage done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TestProject_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TestProject_has_target_tag

ifdef READONLY
cmt_local_tagfile_TestProject = /tmp/CMT_$(TestRelease_tag)_TestProject.make$(cmt_lock_pid)
cmt_final_setup_TestProject = /tmp/CMT_TestRelease_TestProjectsetup.make
cmt_local_TestProject_makefile = /tmp/CMT_TestProject$(cmt_lock_pid).make
else
#cmt_local_tagfile_TestProject = $(TestRelease_tag)_TestProject.make
cmt_local_tagfile_TestProject = $(bin)$(TestRelease_tag)_TestProject.make
cmt_final_setup_TestProject = $(bin)TestRelease_TestProjectsetup.make
cmt_local_TestProject_makefile = $(bin)TestProject.make
endif

TestProject_extratags = -tag_add=target_TestProject

#$(cmt_local_tagfile_TestProject) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TestProject) ::
else
$(cmt_local_tagfile_TestProject) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_TestProject)"
	@if test -f $(cmt_local_tagfile_TestProject); then /bin/rm -f $(cmt_local_tagfile_TestProject); fi ; \
	  $(cmtexe) -tag=$(tags) $(TestProject_extratags) build tag_makefile >>$(cmt_local_tagfile_TestProject); \
	  if test -f $(cmt_final_setup_TestProject); then /bin/rm -f $(cmt_final_setup_TestProject); fi; \
	  $(cmtexe) -tag=$(tags) $(TestProject_extratags) show setup >>$(cmt_final_setup_TestProject)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_TestProject = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_TestProject = /tmp/CMT_TestReleasesetup.make
cmt_local_TestProject_makefile = /tmp/CMT_TestProject$(cmt_lock_pid).make
else
#cmt_local_tagfile_TestProject = $(TestRelease_tag).make
cmt_local_tagfile_TestProject = $(bin)$(TestRelease_tag).make
cmt_final_setup_TestProject = $(bin)TestReleasesetup.make
cmt_local_TestProject_makefile = $(bin)TestProject.make
endif

endif

ifndef QUICK
$(cmt_local_TestProject_makefile) :: $(TestProject_dependencies) $(cmt_local_tagfile_TestProject) build_library_links dirs
else
$(cmt_local_TestProject_makefile) :: $(cmt_local_tagfile_TestProject)
endif
	$(echo) "(constituents.make) Building TestProject.make"; \
	  $(cmtexe) -tag=$(tags) $(TestProject_extratags) build constituent_makefile -out=$(cmt_local_TestProject_makefile) TestProject

TestProject :: $(TestProject_dependencies) $(cmt_local_TestProject_makefile)
	$(echo) "(constituents.make) Creating TestProject${lock_suffix} and Starting TestProject"
	@${lock_command} TestProject${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TestProject${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TestProject_makefile) cmt_lock_pid=$${cmt_lock_pid} TestProject; \
	  retval=$$?; ${unlock_command} TestProject${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TestProject done"

clean :: TestProjectclean

TestProjectclean :: $(TestProjectclean_dependencies) ##$(cmt_local_TestProject_makefile)
	$(echo) "(constituents.make) Starting TestProjectclean"
	@-if test -f $(cmt_local_TestProject_makefile); then \
	  $(MAKE) -f $(cmt_local_TestProject_makefile) cmt_lock_pid=$${cmt_lock_pid} TestProjectclean; \
	fi

##	  /bin/rm -f $(cmt_local_TestProject_makefile) $(bin)TestProject_dependencies.make

install :: TestProjectinstall

TestProjectinstall :: $(TestProject_dependencies) $(cmt_local_TestProject_makefile)
	$(echo) "(constituents.make) Starting install TestProject"
	@-$(MAKE) -f $(cmt_local_TestProject_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install TestProject done"

uninstall :: TestProjectuninstall

TestProjectuninstall :: $(cmt_local_TestProject_makefile)
	$(echo) "(constituents.make) Starting uninstall TestProject"
	@-$(MAKE) -f $(cmt_local_TestProject_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall TestProject done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TestProject"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TestProject done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_new_rootsys_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_new_rootsys_has_target_tag

ifdef READONLY
cmt_local_tagfile_new_rootsys = /tmp/CMT_$(TestRelease_tag)_new_rootsys.make$(cmt_lock_pid)
cmt_final_setup_new_rootsys = /tmp/CMT_TestRelease_new_rootsyssetup.make
cmt_local_new_rootsys_makefile = /tmp/CMT_new_rootsys$(cmt_lock_pid).make
else
#cmt_local_tagfile_new_rootsys = $(TestRelease_tag)_new_rootsys.make
cmt_local_tagfile_new_rootsys = $(bin)$(TestRelease_tag)_new_rootsys.make
cmt_final_setup_new_rootsys = $(bin)TestRelease_new_rootsyssetup.make
cmt_local_new_rootsys_makefile = $(bin)new_rootsys.make
endif

new_rootsys_extratags = -tag_add=target_new_rootsys

#$(cmt_local_tagfile_new_rootsys) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_new_rootsys) ::
else
$(cmt_local_tagfile_new_rootsys) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_new_rootsys)"
	@if test -f $(cmt_local_tagfile_new_rootsys); then /bin/rm -f $(cmt_local_tagfile_new_rootsys); fi ; \
	  $(cmtexe) -tag=$(tags) $(new_rootsys_extratags) build tag_makefile >>$(cmt_local_tagfile_new_rootsys); \
	  if test -f $(cmt_final_setup_new_rootsys); then /bin/rm -f $(cmt_final_setup_new_rootsys); fi; \
	  $(cmtexe) -tag=$(tags) $(new_rootsys_extratags) show setup >>$(cmt_final_setup_new_rootsys)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_new_rootsys = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_new_rootsys = /tmp/CMT_TestReleasesetup.make
cmt_local_new_rootsys_makefile = /tmp/CMT_new_rootsys$(cmt_lock_pid).make
else
#cmt_local_tagfile_new_rootsys = $(TestRelease_tag).make
cmt_local_tagfile_new_rootsys = $(bin)$(TestRelease_tag).make
cmt_final_setup_new_rootsys = $(bin)TestReleasesetup.make
cmt_local_new_rootsys_makefile = $(bin)new_rootsys.make
endif

endif

ifndef QUICK
$(cmt_local_new_rootsys_makefile) :: $(new_rootsys_dependencies) $(cmt_local_tagfile_new_rootsys) build_library_links dirs
else
$(cmt_local_new_rootsys_makefile) :: $(cmt_local_tagfile_new_rootsys)
endif
	$(echo) "(constituents.make) Building new_rootsys.make"; \
	  $(cmtexe) -tag=$(tags) $(new_rootsys_extratags) build constituent_makefile -out=$(cmt_local_new_rootsys_makefile) new_rootsys

new_rootsys :: $(new_rootsys_dependencies) $(cmt_local_new_rootsys_makefile)
	$(echo) "(constituents.make) Creating new_rootsys${lock_suffix} and Starting new_rootsys"
	@${lock_command} new_rootsys${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} new_rootsys${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_new_rootsys_makefile) cmt_lock_pid=$${cmt_lock_pid} new_rootsys; \
	  retval=$$?; ${unlock_command} new_rootsys${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) new_rootsys done"

clean :: new_rootsysclean

new_rootsysclean :: $(new_rootsysclean_dependencies) ##$(cmt_local_new_rootsys_makefile)
	$(echo) "(constituents.make) Starting new_rootsysclean"
	@-if test -f $(cmt_local_new_rootsys_makefile); then \
	  $(MAKE) -f $(cmt_local_new_rootsys_makefile) cmt_lock_pid=$${cmt_lock_pid} new_rootsysclean; \
	fi

##	  /bin/rm -f $(cmt_local_new_rootsys_makefile) $(bin)new_rootsys_dependencies.make

install :: new_rootsysinstall

new_rootsysinstall :: $(new_rootsys_dependencies) $(cmt_local_new_rootsys_makefile)
	$(echo) "(constituents.make) Starting install new_rootsys"
	@-$(MAKE) -f $(cmt_local_new_rootsys_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install new_rootsys done"

uninstall :: new_rootsysuninstall

new_rootsysuninstall :: $(cmt_local_new_rootsys_makefile)
	$(echo) "(constituents.make) Starting uninstall new_rootsys"
	@-$(MAKE) -f $(cmt_local_new_rootsys_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall new_rootsys done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ new_rootsys"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ new_rootsys done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_DatabaseSvc_check_install_scripts_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_DatabaseSvc_check_install_scripts_has_target_tag

ifdef READONLY
cmt_local_tagfile_DatabaseSvc_check_install_scripts = /tmp/CMT_$(TestRelease_tag)_DatabaseSvc_check_install_scripts.make$(cmt_lock_pid)
cmt_final_setup_DatabaseSvc_check_install_scripts = /tmp/CMT_TestRelease_DatabaseSvc_check_install_scriptssetup.make
cmt_local_DatabaseSvc_check_install_scripts_makefile = /tmp/CMT_DatabaseSvc_check_install_scripts$(cmt_lock_pid).make
else
#cmt_local_tagfile_DatabaseSvc_check_install_scripts = $(TestRelease_tag)_DatabaseSvc_check_install_scripts.make
cmt_local_tagfile_DatabaseSvc_check_install_scripts = $(bin)$(TestRelease_tag)_DatabaseSvc_check_install_scripts.make
cmt_final_setup_DatabaseSvc_check_install_scripts = $(bin)TestRelease_DatabaseSvc_check_install_scriptssetup.make
cmt_local_DatabaseSvc_check_install_scripts_makefile = $(bin)DatabaseSvc_check_install_scripts.make
endif

DatabaseSvc_check_install_scripts_extratags = -tag_add=target_DatabaseSvc_check_install_scripts

#$(cmt_local_tagfile_DatabaseSvc_check_install_scripts) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_DatabaseSvc_check_install_scripts) ::
else
$(cmt_local_tagfile_DatabaseSvc_check_install_scripts) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_DatabaseSvc_check_install_scripts)"
	@if test -f $(cmt_local_tagfile_DatabaseSvc_check_install_scripts); then /bin/rm -f $(cmt_local_tagfile_DatabaseSvc_check_install_scripts); fi ; \
	  $(cmtexe) -tag=$(tags) $(DatabaseSvc_check_install_scripts_extratags) build tag_makefile >>$(cmt_local_tagfile_DatabaseSvc_check_install_scripts); \
	  if test -f $(cmt_final_setup_DatabaseSvc_check_install_scripts); then /bin/rm -f $(cmt_final_setup_DatabaseSvc_check_install_scripts); fi; \
	  $(cmtexe) -tag=$(tags) $(DatabaseSvc_check_install_scripts_extratags) show setup >>$(cmt_final_setup_DatabaseSvc_check_install_scripts)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_DatabaseSvc_check_install_scripts = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_DatabaseSvc_check_install_scripts = /tmp/CMT_TestReleasesetup.make
cmt_local_DatabaseSvc_check_install_scripts_makefile = /tmp/CMT_DatabaseSvc_check_install_scripts$(cmt_lock_pid).make
else
#cmt_local_tagfile_DatabaseSvc_check_install_scripts = $(TestRelease_tag).make
cmt_local_tagfile_DatabaseSvc_check_install_scripts = $(bin)$(TestRelease_tag).make
cmt_final_setup_DatabaseSvc_check_install_scripts = $(bin)TestReleasesetup.make
cmt_local_DatabaseSvc_check_install_scripts_makefile = $(bin)DatabaseSvc_check_install_scripts.make
endif

endif

ifndef QUICK
$(cmt_local_DatabaseSvc_check_install_scripts_makefile) :: $(DatabaseSvc_check_install_scripts_dependencies) $(cmt_local_tagfile_DatabaseSvc_check_install_scripts) build_library_links dirs
else
$(cmt_local_DatabaseSvc_check_install_scripts_makefile) :: $(cmt_local_tagfile_DatabaseSvc_check_install_scripts)
endif
	$(echo) "(constituents.make) Building DatabaseSvc_check_install_scripts.make"; \
	  $(cmtexe) -tag=$(tags) $(DatabaseSvc_check_install_scripts_extratags) build constituent_makefile -out=$(cmt_local_DatabaseSvc_check_install_scripts_makefile) DatabaseSvc_check_install_scripts

DatabaseSvc_check_install_scripts :: $(DatabaseSvc_check_install_scripts_dependencies) $(cmt_local_DatabaseSvc_check_install_scripts_makefile)
	$(echo) "(constituents.make) Creating DatabaseSvc_check_install_scripts${lock_suffix} and Starting DatabaseSvc_check_install_scripts"
	@${lock_command} DatabaseSvc_check_install_scripts${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} DatabaseSvc_check_install_scripts${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_DatabaseSvc_check_install_scripts_makefile) cmt_lock_pid=$${cmt_lock_pid} DatabaseSvc_check_install_scripts; \
	  retval=$$?; ${unlock_command} DatabaseSvc_check_install_scripts${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) DatabaseSvc_check_install_scripts done"

clean :: DatabaseSvc_check_install_scriptsclean

DatabaseSvc_check_install_scriptsclean :: $(DatabaseSvc_check_install_scriptsclean_dependencies) ##$(cmt_local_DatabaseSvc_check_install_scripts_makefile)
	$(echo) "(constituents.make) Starting DatabaseSvc_check_install_scriptsclean"
	@-if test -f $(cmt_local_DatabaseSvc_check_install_scripts_makefile); then \
	  $(MAKE) -f $(cmt_local_DatabaseSvc_check_install_scripts_makefile) cmt_lock_pid=$${cmt_lock_pid} DatabaseSvc_check_install_scriptsclean; \
	fi

##	  /bin/rm -f $(cmt_local_DatabaseSvc_check_install_scripts_makefile) $(bin)DatabaseSvc_check_install_scripts_dependencies.make

install :: DatabaseSvc_check_install_scriptsinstall

DatabaseSvc_check_install_scriptsinstall :: $(DatabaseSvc_check_install_scripts_dependencies) $(cmt_local_DatabaseSvc_check_install_scripts_makefile)
	$(echo) "(constituents.make) Starting install DatabaseSvc_check_install_scripts"
	@-$(MAKE) -f $(cmt_local_DatabaseSvc_check_install_scripts_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install DatabaseSvc_check_install_scripts done"

uninstall :: DatabaseSvc_check_install_scriptsuninstall

DatabaseSvc_check_install_scriptsuninstall :: $(cmt_local_DatabaseSvc_check_install_scripts_makefile)
	$(echo) "(constituents.make) Starting uninstall DatabaseSvc_check_install_scripts"
	@-$(MAKE) -f $(cmt_local_DatabaseSvc_check_install_scripts_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall DatabaseSvc_check_install_scripts done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ DatabaseSvc_check_install_scripts"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ DatabaseSvc_check_install_scripts done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_RhopiAlg_check_install_runtime_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_RhopiAlg_check_install_runtime_has_target_tag

ifdef READONLY
cmt_local_tagfile_RhopiAlg_check_install_runtime = /tmp/CMT_$(TestRelease_tag)_RhopiAlg_check_install_runtime.make$(cmt_lock_pid)
cmt_final_setup_RhopiAlg_check_install_runtime = /tmp/CMT_TestRelease_RhopiAlg_check_install_runtimesetup.make
cmt_local_RhopiAlg_check_install_runtime_makefile = /tmp/CMT_RhopiAlg_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_RhopiAlg_check_install_runtime = $(TestRelease_tag)_RhopiAlg_check_install_runtime.make
cmt_local_tagfile_RhopiAlg_check_install_runtime = $(bin)$(TestRelease_tag)_RhopiAlg_check_install_runtime.make
cmt_final_setup_RhopiAlg_check_install_runtime = $(bin)TestRelease_RhopiAlg_check_install_runtimesetup.make
cmt_local_RhopiAlg_check_install_runtime_makefile = $(bin)RhopiAlg_check_install_runtime.make
endif

RhopiAlg_check_install_runtime_extratags = -tag_add=target_RhopiAlg_check_install_runtime

#$(cmt_local_tagfile_RhopiAlg_check_install_runtime) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_RhopiAlg_check_install_runtime) ::
else
$(cmt_local_tagfile_RhopiAlg_check_install_runtime) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_RhopiAlg_check_install_runtime)"
	@if test -f $(cmt_local_tagfile_RhopiAlg_check_install_runtime); then /bin/rm -f $(cmt_local_tagfile_RhopiAlg_check_install_runtime); fi ; \
	  $(cmtexe) -tag=$(tags) $(RhopiAlg_check_install_runtime_extratags) build tag_makefile >>$(cmt_local_tagfile_RhopiAlg_check_install_runtime); \
	  if test -f $(cmt_final_setup_RhopiAlg_check_install_runtime); then /bin/rm -f $(cmt_final_setup_RhopiAlg_check_install_runtime); fi; \
	  $(cmtexe) -tag=$(tags) $(RhopiAlg_check_install_runtime_extratags) show setup >>$(cmt_final_setup_RhopiAlg_check_install_runtime)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_RhopiAlg_check_install_runtime = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_RhopiAlg_check_install_runtime = /tmp/CMT_TestReleasesetup.make
cmt_local_RhopiAlg_check_install_runtime_makefile = /tmp/CMT_RhopiAlg_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_RhopiAlg_check_install_runtime = $(TestRelease_tag).make
cmt_local_tagfile_RhopiAlg_check_install_runtime = $(bin)$(TestRelease_tag).make
cmt_final_setup_RhopiAlg_check_install_runtime = $(bin)TestReleasesetup.make
cmt_local_RhopiAlg_check_install_runtime_makefile = $(bin)RhopiAlg_check_install_runtime.make
endif

endif

ifndef QUICK
$(cmt_local_RhopiAlg_check_install_runtime_makefile) :: $(RhopiAlg_check_install_runtime_dependencies) $(cmt_local_tagfile_RhopiAlg_check_install_runtime) build_library_links dirs
else
$(cmt_local_RhopiAlg_check_install_runtime_makefile) :: $(cmt_local_tagfile_RhopiAlg_check_install_runtime)
endif
	$(echo) "(constituents.make) Building RhopiAlg_check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(RhopiAlg_check_install_runtime_extratags) build constituent_makefile -out=$(cmt_local_RhopiAlg_check_install_runtime_makefile) RhopiAlg_check_install_runtime

RhopiAlg_check_install_runtime :: $(RhopiAlg_check_install_runtime_dependencies) $(cmt_local_RhopiAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Creating RhopiAlg_check_install_runtime${lock_suffix} and Starting RhopiAlg_check_install_runtime"
	@${lock_command} RhopiAlg_check_install_runtime${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} RhopiAlg_check_install_runtime${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_RhopiAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} RhopiAlg_check_install_runtime; \
	  retval=$$?; ${unlock_command} RhopiAlg_check_install_runtime${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) RhopiAlg_check_install_runtime done"

clean :: RhopiAlg_check_install_runtimeclean

RhopiAlg_check_install_runtimeclean :: $(RhopiAlg_check_install_runtimeclean_dependencies) ##$(cmt_local_RhopiAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting RhopiAlg_check_install_runtimeclean"
	@-if test -f $(cmt_local_RhopiAlg_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_RhopiAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} RhopiAlg_check_install_runtimeclean; \
	fi

##	  /bin/rm -f $(cmt_local_RhopiAlg_check_install_runtime_makefile) $(bin)RhopiAlg_check_install_runtime_dependencies.make

install :: RhopiAlg_check_install_runtimeinstall

RhopiAlg_check_install_runtimeinstall :: $(RhopiAlg_check_install_runtime_dependencies) $(cmt_local_RhopiAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting install RhopiAlg_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_RhopiAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install RhopiAlg_check_install_runtime done"

uninstall :: RhopiAlg_check_install_runtimeuninstall

RhopiAlg_check_install_runtimeuninstall :: $(cmt_local_RhopiAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting uninstall RhopiAlg_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_RhopiAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall RhopiAlg_check_install_runtime done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ RhopiAlg_check_install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ RhopiAlg_check_install_runtime done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_tofcalgsec_check_install_runtime_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_tofcalgsec_check_install_runtime_has_target_tag

ifdef READONLY
cmt_local_tagfile_tofcalgsec_check_install_runtime = /tmp/CMT_$(TestRelease_tag)_tofcalgsec_check_install_runtime.make$(cmt_lock_pid)
cmt_final_setup_tofcalgsec_check_install_runtime = /tmp/CMT_TestRelease_tofcalgsec_check_install_runtimesetup.make
cmt_local_tofcalgsec_check_install_runtime_makefile = /tmp/CMT_tofcalgsec_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_tofcalgsec_check_install_runtime = $(TestRelease_tag)_tofcalgsec_check_install_runtime.make
cmt_local_tagfile_tofcalgsec_check_install_runtime = $(bin)$(TestRelease_tag)_tofcalgsec_check_install_runtime.make
cmt_final_setup_tofcalgsec_check_install_runtime = $(bin)TestRelease_tofcalgsec_check_install_runtimesetup.make
cmt_local_tofcalgsec_check_install_runtime_makefile = $(bin)tofcalgsec_check_install_runtime.make
endif

tofcalgsec_check_install_runtime_extratags = -tag_add=target_tofcalgsec_check_install_runtime

#$(cmt_local_tagfile_tofcalgsec_check_install_runtime) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_tofcalgsec_check_install_runtime) ::
else
$(cmt_local_tagfile_tofcalgsec_check_install_runtime) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_tofcalgsec_check_install_runtime)"
	@if test -f $(cmt_local_tagfile_tofcalgsec_check_install_runtime); then /bin/rm -f $(cmt_local_tagfile_tofcalgsec_check_install_runtime); fi ; \
	  $(cmtexe) -tag=$(tags) $(tofcalgsec_check_install_runtime_extratags) build tag_makefile >>$(cmt_local_tagfile_tofcalgsec_check_install_runtime); \
	  if test -f $(cmt_final_setup_tofcalgsec_check_install_runtime); then /bin/rm -f $(cmt_final_setup_tofcalgsec_check_install_runtime); fi; \
	  $(cmtexe) -tag=$(tags) $(tofcalgsec_check_install_runtime_extratags) show setup >>$(cmt_final_setup_tofcalgsec_check_install_runtime)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_tofcalgsec_check_install_runtime = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_tofcalgsec_check_install_runtime = /tmp/CMT_TestReleasesetup.make
cmt_local_tofcalgsec_check_install_runtime_makefile = /tmp/CMT_tofcalgsec_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_tofcalgsec_check_install_runtime = $(TestRelease_tag).make
cmt_local_tagfile_tofcalgsec_check_install_runtime = $(bin)$(TestRelease_tag).make
cmt_final_setup_tofcalgsec_check_install_runtime = $(bin)TestReleasesetup.make
cmt_local_tofcalgsec_check_install_runtime_makefile = $(bin)tofcalgsec_check_install_runtime.make
endif

endif

ifndef QUICK
$(cmt_local_tofcalgsec_check_install_runtime_makefile) :: $(tofcalgsec_check_install_runtime_dependencies) $(cmt_local_tagfile_tofcalgsec_check_install_runtime) build_library_links dirs
else
$(cmt_local_tofcalgsec_check_install_runtime_makefile) :: $(cmt_local_tagfile_tofcalgsec_check_install_runtime)
endif
	$(echo) "(constituents.make) Building tofcalgsec_check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(tofcalgsec_check_install_runtime_extratags) build constituent_makefile -out=$(cmt_local_tofcalgsec_check_install_runtime_makefile) tofcalgsec_check_install_runtime

tofcalgsec_check_install_runtime :: $(tofcalgsec_check_install_runtime_dependencies) $(cmt_local_tofcalgsec_check_install_runtime_makefile)
	$(echo) "(constituents.make) Creating tofcalgsec_check_install_runtime${lock_suffix} and Starting tofcalgsec_check_install_runtime"
	@${lock_command} tofcalgsec_check_install_runtime${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} tofcalgsec_check_install_runtime${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_tofcalgsec_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} tofcalgsec_check_install_runtime; \
	  retval=$$?; ${unlock_command} tofcalgsec_check_install_runtime${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) tofcalgsec_check_install_runtime done"

clean :: tofcalgsec_check_install_runtimeclean

tofcalgsec_check_install_runtimeclean :: $(tofcalgsec_check_install_runtimeclean_dependencies) ##$(cmt_local_tofcalgsec_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting tofcalgsec_check_install_runtimeclean"
	@-if test -f $(cmt_local_tofcalgsec_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_tofcalgsec_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} tofcalgsec_check_install_runtimeclean; \
	fi

##	  /bin/rm -f $(cmt_local_tofcalgsec_check_install_runtime_makefile) $(bin)tofcalgsec_check_install_runtime_dependencies.make

install :: tofcalgsec_check_install_runtimeinstall

tofcalgsec_check_install_runtimeinstall :: $(tofcalgsec_check_install_runtime_dependencies) $(cmt_local_tofcalgsec_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting install tofcalgsec_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_tofcalgsec_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install tofcalgsec_check_install_runtime done"

uninstall :: tofcalgsec_check_install_runtimeuninstall

tofcalgsec_check_install_runtimeuninstall :: $(cmt_local_tofcalgsec_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting uninstall tofcalgsec_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_tofcalgsec_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall tofcalgsec_check_install_runtime done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ tofcalgsec_check_install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ tofcalgsec_check_install_runtime done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_OfflineEventLoopMgr_check_install_joboptions_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_OfflineEventLoopMgr_check_install_joboptions_has_target_tag

ifdef READONLY
cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions = /tmp/CMT_$(TestRelease_tag)_OfflineEventLoopMgr_check_install_joboptions.make$(cmt_lock_pid)
cmt_final_setup_OfflineEventLoopMgr_check_install_joboptions = /tmp/CMT_TestRelease_OfflineEventLoopMgr_check_install_joboptionssetup.make
cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile = /tmp/CMT_OfflineEventLoopMgr_check_install_joboptions$(cmt_lock_pid).make
else
#cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions = $(TestRelease_tag)_OfflineEventLoopMgr_check_install_joboptions.make
cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions = $(bin)$(TestRelease_tag)_OfflineEventLoopMgr_check_install_joboptions.make
cmt_final_setup_OfflineEventLoopMgr_check_install_joboptions = $(bin)TestRelease_OfflineEventLoopMgr_check_install_joboptionssetup.make
cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile = $(bin)OfflineEventLoopMgr_check_install_joboptions.make
endif

OfflineEventLoopMgr_check_install_joboptions_extratags = -tag_add=target_OfflineEventLoopMgr_check_install_joboptions

#$(cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions) ::
else
$(cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions)"
	@if test -f $(cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions); then /bin/rm -f $(cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions); fi ; \
	  $(cmtexe) -tag=$(tags) $(OfflineEventLoopMgr_check_install_joboptions_extratags) build tag_makefile >>$(cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions); \
	  if test -f $(cmt_final_setup_OfflineEventLoopMgr_check_install_joboptions); then /bin/rm -f $(cmt_final_setup_OfflineEventLoopMgr_check_install_joboptions); fi; \
	  $(cmtexe) -tag=$(tags) $(OfflineEventLoopMgr_check_install_joboptions_extratags) show setup >>$(cmt_final_setup_OfflineEventLoopMgr_check_install_joboptions)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_OfflineEventLoopMgr_check_install_joboptions = /tmp/CMT_TestReleasesetup.make
cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile = /tmp/CMT_OfflineEventLoopMgr_check_install_joboptions$(cmt_lock_pid).make
else
#cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions = $(TestRelease_tag).make
cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions = $(bin)$(TestRelease_tag).make
cmt_final_setup_OfflineEventLoopMgr_check_install_joboptions = $(bin)TestReleasesetup.make
cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile = $(bin)OfflineEventLoopMgr_check_install_joboptions.make
endif

endif

ifndef QUICK
$(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile) :: $(OfflineEventLoopMgr_check_install_joboptions_dependencies) $(cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions) build_library_links dirs
else
$(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile) :: $(cmt_local_tagfile_OfflineEventLoopMgr_check_install_joboptions)
endif
	$(echo) "(constituents.make) Building OfflineEventLoopMgr_check_install_joboptions.make"; \
	  $(cmtexe) -tag=$(tags) $(OfflineEventLoopMgr_check_install_joboptions_extratags) build constituent_makefile -out=$(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile) OfflineEventLoopMgr_check_install_joboptions

OfflineEventLoopMgr_check_install_joboptions :: $(OfflineEventLoopMgr_check_install_joboptions_dependencies) $(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile)
	$(echo) "(constituents.make) Creating OfflineEventLoopMgr_check_install_joboptions${lock_suffix} and Starting OfflineEventLoopMgr_check_install_joboptions"
	@${lock_command} OfflineEventLoopMgr_check_install_joboptions${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} OfflineEventLoopMgr_check_install_joboptions${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile) cmt_lock_pid=$${cmt_lock_pid} OfflineEventLoopMgr_check_install_joboptions; \
	  retval=$$?; ${unlock_command} OfflineEventLoopMgr_check_install_joboptions${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) OfflineEventLoopMgr_check_install_joboptions done"

clean :: OfflineEventLoopMgr_check_install_joboptionsclean

OfflineEventLoopMgr_check_install_joboptionsclean :: $(OfflineEventLoopMgr_check_install_joboptionsclean_dependencies) ##$(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile)
	$(echo) "(constituents.make) Starting OfflineEventLoopMgr_check_install_joboptionsclean"
	@-if test -f $(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile); then \
	  $(MAKE) -f $(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile) cmt_lock_pid=$${cmt_lock_pid} OfflineEventLoopMgr_check_install_joboptionsclean; \
	fi

##	  /bin/rm -f $(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile) $(bin)OfflineEventLoopMgr_check_install_joboptions_dependencies.make

install :: OfflineEventLoopMgr_check_install_joboptionsinstall

OfflineEventLoopMgr_check_install_joboptionsinstall :: $(OfflineEventLoopMgr_check_install_joboptions_dependencies) $(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile)
	$(echo) "(constituents.make) Starting install OfflineEventLoopMgr_check_install_joboptions"
	@-$(MAKE) -f $(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install OfflineEventLoopMgr_check_install_joboptions done"

uninstall :: OfflineEventLoopMgr_check_install_joboptionsuninstall

OfflineEventLoopMgr_check_install_joboptionsuninstall :: $(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile)
	$(echo) "(constituents.make) Starting uninstall OfflineEventLoopMgr_check_install_joboptions"
	@-$(MAKE) -f $(cmt_local_OfflineEventLoopMgr_check_install_joboptions_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall OfflineEventLoopMgr_check_install_joboptions done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ OfflineEventLoopMgr_check_install_joboptions"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ OfflineEventLoopMgr_check_install_joboptions done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_Reconstruction_check_install_runtime_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_Reconstruction_check_install_runtime_has_target_tag

ifdef READONLY
cmt_local_tagfile_Reconstruction_check_install_runtime = /tmp/CMT_$(TestRelease_tag)_Reconstruction_check_install_runtime.make$(cmt_lock_pid)
cmt_final_setup_Reconstruction_check_install_runtime = /tmp/CMT_TestRelease_Reconstruction_check_install_runtimesetup.make
cmt_local_Reconstruction_check_install_runtime_makefile = /tmp/CMT_Reconstruction_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_Reconstruction_check_install_runtime = $(TestRelease_tag)_Reconstruction_check_install_runtime.make
cmt_local_tagfile_Reconstruction_check_install_runtime = $(bin)$(TestRelease_tag)_Reconstruction_check_install_runtime.make
cmt_final_setup_Reconstruction_check_install_runtime = $(bin)TestRelease_Reconstruction_check_install_runtimesetup.make
cmt_local_Reconstruction_check_install_runtime_makefile = $(bin)Reconstruction_check_install_runtime.make
endif

Reconstruction_check_install_runtime_extratags = -tag_add=target_Reconstruction_check_install_runtime

#$(cmt_local_tagfile_Reconstruction_check_install_runtime) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_Reconstruction_check_install_runtime) ::
else
$(cmt_local_tagfile_Reconstruction_check_install_runtime) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_Reconstruction_check_install_runtime)"
	@if test -f $(cmt_local_tagfile_Reconstruction_check_install_runtime); then /bin/rm -f $(cmt_local_tagfile_Reconstruction_check_install_runtime); fi ; \
	  $(cmtexe) -tag=$(tags) $(Reconstruction_check_install_runtime_extratags) build tag_makefile >>$(cmt_local_tagfile_Reconstruction_check_install_runtime); \
	  if test -f $(cmt_final_setup_Reconstruction_check_install_runtime); then /bin/rm -f $(cmt_final_setup_Reconstruction_check_install_runtime); fi; \
	  $(cmtexe) -tag=$(tags) $(Reconstruction_check_install_runtime_extratags) show setup >>$(cmt_final_setup_Reconstruction_check_install_runtime)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_Reconstruction_check_install_runtime = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_Reconstruction_check_install_runtime = /tmp/CMT_TestReleasesetup.make
cmt_local_Reconstruction_check_install_runtime_makefile = /tmp/CMT_Reconstruction_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_Reconstruction_check_install_runtime = $(TestRelease_tag).make
cmt_local_tagfile_Reconstruction_check_install_runtime = $(bin)$(TestRelease_tag).make
cmt_final_setup_Reconstruction_check_install_runtime = $(bin)TestReleasesetup.make
cmt_local_Reconstruction_check_install_runtime_makefile = $(bin)Reconstruction_check_install_runtime.make
endif

endif

ifndef QUICK
$(cmt_local_Reconstruction_check_install_runtime_makefile) :: $(Reconstruction_check_install_runtime_dependencies) $(cmt_local_tagfile_Reconstruction_check_install_runtime) build_library_links dirs
else
$(cmt_local_Reconstruction_check_install_runtime_makefile) :: $(cmt_local_tagfile_Reconstruction_check_install_runtime)
endif
	$(echo) "(constituents.make) Building Reconstruction_check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(Reconstruction_check_install_runtime_extratags) build constituent_makefile -out=$(cmt_local_Reconstruction_check_install_runtime_makefile) Reconstruction_check_install_runtime

Reconstruction_check_install_runtime :: $(Reconstruction_check_install_runtime_dependencies) $(cmt_local_Reconstruction_check_install_runtime_makefile)
	$(echo) "(constituents.make) Creating Reconstruction_check_install_runtime${lock_suffix} and Starting Reconstruction_check_install_runtime"
	@${lock_command} Reconstruction_check_install_runtime${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} Reconstruction_check_install_runtime${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_Reconstruction_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} Reconstruction_check_install_runtime; \
	  retval=$$?; ${unlock_command} Reconstruction_check_install_runtime${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) Reconstruction_check_install_runtime done"

clean :: Reconstruction_check_install_runtimeclean

Reconstruction_check_install_runtimeclean :: $(Reconstruction_check_install_runtimeclean_dependencies) ##$(cmt_local_Reconstruction_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting Reconstruction_check_install_runtimeclean"
	@-if test -f $(cmt_local_Reconstruction_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_Reconstruction_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} Reconstruction_check_install_runtimeclean; \
	fi

##	  /bin/rm -f $(cmt_local_Reconstruction_check_install_runtime_makefile) $(bin)Reconstruction_check_install_runtime_dependencies.make

install :: Reconstruction_check_install_runtimeinstall

Reconstruction_check_install_runtimeinstall :: $(Reconstruction_check_install_runtime_dependencies) $(cmt_local_Reconstruction_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting install Reconstruction_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_Reconstruction_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install Reconstruction_check_install_runtime done"

uninstall :: Reconstruction_check_install_runtimeuninstall

Reconstruction_check_install_runtimeuninstall :: $(cmt_local_Reconstruction_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting uninstall Reconstruction_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_Reconstruction_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall Reconstruction_check_install_runtime done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ Reconstruction_check_install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ Reconstruction_check_install_runtime done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_EventNavigator_check_install_runtime_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_EventNavigator_check_install_runtime_has_target_tag

ifdef READONLY
cmt_local_tagfile_EventNavigator_check_install_runtime = /tmp/CMT_$(TestRelease_tag)_EventNavigator_check_install_runtime.make$(cmt_lock_pid)
cmt_final_setup_EventNavigator_check_install_runtime = /tmp/CMT_TestRelease_EventNavigator_check_install_runtimesetup.make
cmt_local_EventNavigator_check_install_runtime_makefile = /tmp/CMT_EventNavigator_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_EventNavigator_check_install_runtime = $(TestRelease_tag)_EventNavigator_check_install_runtime.make
cmt_local_tagfile_EventNavigator_check_install_runtime = $(bin)$(TestRelease_tag)_EventNavigator_check_install_runtime.make
cmt_final_setup_EventNavigator_check_install_runtime = $(bin)TestRelease_EventNavigator_check_install_runtimesetup.make
cmt_local_EventNavigator_check_install_runtime_makefile = $(bin)EventNavigator_check_install_runtime.make
endif

EventNavigator_check_install_runtime_extratags = -tag_add=target_EventNavigator_check_install_runtime

#$(cmt_local_tagfile_EventNavigator_check_install_runtime) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_EventNavigator_check_install_runtime) ::
else
$(cmt_local_tagfile_EventNavigator_check_install_runtime) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_EventNavigator_check_install_runtime)"
	@if test -f $(cmt_local_tagfile_EventNavigator_check_install_runtime); then /bin/rm -f $(cmt_local_tagfile_EventNavigator_check_install_runtime); fi ; \
	  $(cmtexe) -tag=$(tags) $(EventNavigator_check_install_runtime_extratags) build tag_makefile >>$(cmt_local_tagfile_EventNavigator_check_install_runtime); \
	  if test -f $(cmt_final_setup_EventNavigator_check_install_runtime); then /bin/rm -f $(cmt_final_setup_EventNavigator_check_install_runtime); fi; \
	  $(cmtexe) -tag=$(tags) $(EventNavigator_check_install_runtime_extratags) show setup >>$(cmt_final_setup_EventNavigator_check_install_runtime)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_EventNavigator_check_install_runtime = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_EventNavigator_check_install_runtime = /tmp/CMT_TestReleasesetup.make
cmt_local_EventNavigator_check_install_runtime_makefile = /tmp/CMT_EventNavigator_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_EventNavigator_check_install_runtime = $(TestRelease_tag).make
cmt_local_tagfile_EventNavigator_check_install_runtime = $(bin)$(TestRelease_tag).make
cmt_final_setup_EventNavigator_check_install_runtime = $(bin)TestReleasesetup.make
cmt_local_EventNavigator_check_install_runtime_makefile = $(bin)EventNavigator_check_install_runtime.make
endif

endif

ifndef QUICK
$(cmt_local_EventNavigator_check_install_runtime_makefile) :: $(EventNavigator_check_install_runtime_dependencies) $(cmt_local_tagfile_EventNavigator_check_install_runtime) build_library_links dirs
else
$(cmt_local_EventNavigator_check_install_runtime_makefile) :: $(cmt_local_tagfile_EventNavigator_check_install_runtime)
endif
	$(echo) "(constituents.make) Building EventNavigator_check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(EventNavigator_check_install_runtime_extratags) build constituent_makefile -out=$(cmt_local_EventNavigator_check_install_runtime_makefile) EventNavigator_check_install_runtime

EventNavigator_check_install_runtime :: $(EventNavigator_check_install_runtime_dependencies) $(cmt_local_EventNavigator_check_install_runtime_makefile)
	$(echo) "(constituents.make) Creating EventNavigator_check_install_runtime${lock_suffix} and Starting EventNavigator_check_install_runtime"
	@${lock_command} EventNavigator_check_install_runtime${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} EventNavigator_check_install_runtime${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_EventNavigator_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} EventNavigator_check_install_runtime; \
	  retval=$$?; ${unlock_command} EventNavigator_check_install_runtime${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) EventNavigator_check_install_runtime done"

clean :: EventNavigator_check_install_runtimeclean

EventNavigator_check_install_runtimeclean :: $(EventNavigator_check_install_runtimeclean_dependencies) ##$(cmt_local_EventNavigator_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting EventNavigator_check_install_runtimeclean"
	@-if test -f $(cmt_local_EventNavigator_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_EventNavigator_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} EventNavigator_check_install_runtimeclean; \
	fi

##	  /bin/rm -f $(cmt_local_EventNavigator_check_install_runtime_makefile) $(bin)EventNavigator_check_install_runtime_dependencies.make

install :: EventNavigator_check_install_runtimeinstall

EventNavigator_check_install_runtimeinstall :: $(EventNavigator_check_install_runtime_dependencies) $(cmt_local_EventNavigator_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting install EventNavigator_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_EventNavigator_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install EventNavigator_check_install_runtime done"

uninstall :: EventNavigator_check_install_runtimeuninstall

EventNavigator_check_install_runtimeuninstall :: $(cmt_local_EventNavigator_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting uninstall EventNavigator_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_EventNavigator_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall EventNavigator_check_install_runtime done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ EventNavigator_check_install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ EventNavigator_check_install_runtime done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_Gam4pikpAlg_check_install_runtime_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_Gam4pikpAlg_check_install_runtime_has_target_tag

ifdef READONLY
cmt_local_tagfile_Gam4pikpAlg_check_install_runtime = /tmp/CMT_$(TestRelease_tag)_Gam4pikpAlg_check_install_runtime.make$(cmt_lock_pid)
cmt_final_setup_Gam4pikpAlg_check_install_runtime = /tmp/CMT_TestRelease_Gam4pikpAlg_check_install_runtimesetup.make
cmt_local_Gam4pikpAlg_check_install_runtime_makefile = /tmp/CMT_Gam4pikpAlg_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_Gam4pikpAlg_check_install_runtime = $(TestRelease_tag)_Gam4pikpAlg_check_install_runtime.make
cmt_local_tagfile_Gam4pikpAlg_check_install_runtime = $(bin)$(TestRelease_tag)_Gam4pikpAlg_check_install_runtime.make
cmt_final_setup_Gam4pikpAlg_check_install_runtime = $(bin)TestRelease_Gam4pikpAlg_check_install_runtimesetup.make
cmt_local_Gam4pikpAlg_check_install_runtime_makefile = $(bin)Gam4pikpAlg_check_install_runtime.make
endif

Gam4pikpAlg_check_install_runtime_extratags = -tag_add=target_Gam4pikpAlg_check_install_runtime

#$(cmt_local_tagfile_Gam4pikpAlg_check_install_runtime) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_Gam4pikpAlg_check_install_runtime) ::
else
$(cmt_local_tagfile_Gam4pikpAlg_check_install_runtime) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_Gam4pikpAlg_check_install_runtime)"
	@if test -f $(cmt_local_tagfile_Gam4pikpAlg_check_install_runtime); then /bin/rm -f $(cmt_local_tagfile_Gam4pikpAlg_check_install_runtime); fi ; \
	  $(cmtexe) -tag=$(tags) $(Gam4pikpAlg_check_install_runtime_extratags) build tag_makefile >>$(cmt_local_tagfile_Gam4pikpAlg_check_install_runtime); \
	  if test -f $(cmt_final_setup_Gam4pikpAlg_check_install_runtime); then /bin/rm -f $(cmt_final_setup_Gam4pikpAlg_check_install_runtime); fi; \
	  $(cmtexe) -tag=$(tags) $(Gam4pikpAlg_check_install_runtime_extratags) show setup >>$(cmt_final_setup_Gam4pikpAlg_check_install_runtime)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_Gam4pikpAlg_check_install_runtime = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_Gam4pikpAlg_check_install_runtime = /tmp/CMT_TestReleasesetup.make
cmt_local_Gam4pikpAlg_check_install_runtime_makefile = /tmp/CMT_Gam4pikpAlg_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_Gam4pikpAlg_check_install_runtime = $(TestRelease_tag).make
cmt_local_tagfile_Gam4pikpAlg_check_install_runtime = $(bin)$(TestRelease_tag).make
cmt_final_setup_Gam4pikpAlg_check_install_runtime = $(bin)TestReleasesetup.make
cmt_local_Gam4pikpAlg_check_install_runtime_makefile = $(bin)Gam4pikpAlg_check_install_runtime.make
endif

endif

ifndef QUICK
$(cmt_local_Gam4pikpAlg_check_install_runtime_makefile) :: $(Gam4pikpAlg_check_install_runtime_dependencies) $(cmt_local_tagfile_Gam4pikpAlg_check_install_runtime) build_library_links dirs
else
$(cmt_local_Gam4pikpAlg_check_install_runtime_makefile) :: $(cmt_local_tagfile_Gam4pikpAlg_check_install_runtime)
endif
	$(echo) "(constituents.make) Building Gam4pikpAlg_check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(Gam4pikpAlg_check_install_runtime_extratags) build constituent_makefile -out=$(cmt_local_Gam4pikpAlg_check_install_runtime_makefile) Gam4pikpAlg_check_install_runtime

Gam4pikpAlg_check_install_runtime :: $(Gam4pikpAlg_check_install_runtime_dependencies) $(cmt_local_Gam4pikpAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Creating Gam4pikpAlg_check_install_runtime${lock_suffix} and Starting Gam4pikpAlg_check_install_runtime"
	@${lock_command} Gam4pikpAlg_check_install_runtime${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} Gam4pikpAlg_check_install_runtime${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_Gam4pikpAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} Gam4pikpAlg_check_install_runtime; \
	  retval=$$?; ${unlock_command} Gam4pikpAlg_check_install_runtime${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) Gam4pikpAlg_check_install_runtime done"

clean :: Gam4pikpAlg_check_install_runtimeclean

Gam4pikpAlg_check_install_runtimeclean :: $(Gam4pikpAlg_check_install_runtimeclean_dependencies) ##$(cmt_local_Gam4pikpAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting Gam4pikpAlg_check_install_runtimeclean"
	@-if test -f $(cmt_local_Gam4pikpAlg_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_Gam4pikpAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} Gam4pikpAlg_check_install_runtimeclean; \
	fi

##	  /bin/rm -f $(cmt_local_Gam4pikpAlg_check_install_runtime_makefile) $(bin)Gam4pikpAlg_check_install_runtime_dependencies.make

install :: Gam4pikpAlg_check_install_runtimeinstall

Gam4pikpAlg_check_install_runtimeinstall :: $(Gam4pikpAlg_check_install_runtime_dependencies) $(cmt_local_Gam4pikpAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting install Gam4pikpAlg_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_Gam4pikpAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install Gam4pikpAlg_check_install_runtime done"

uninstall :: Gam4pikpAlg_check_install_runtimeuninstall

Gam4pikpAlg_check_install_runtimeuninstall :: $(cmt_local_Gam4pikpAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting uninstall Gam4pikpAlg_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_Gam4pikpAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall Gam4pikpAlg_check_install_runtime done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ Gam4pikpAlg_check_install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ Gam4pikpAlg_check_install_runtime done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_BesEvtGen_check_install_runtime_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_BesEvtGen_check_install_runtime_has_target_tag

ifdef READONLY
cmt_local_tagfile_BesEvtGen_check_install_runtime = /tmp/CMT_$(TestRelease_tag)_BesEvtGen_check_install_runtime.make$(cmt_lock_pid)
cmt_final_setup_BesEvtGen_check_install_runtime = /tmp/CMT_TestRelease_BesEvtGen_check_install_runtimesetup.make
cmt_local_BesEvtGen_check_install_runtime_makefile = /tmp/CMT_BesEvtGen_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_BesEvtGen_check_install_runtime = $(TestRelease_tag)_BesEvtGen_check_install_runtime.make
cmt_local_tagfile_BesEvtGen_check_install_runtime = $(bin)$(TestRelease_tag)_BesEvtGen_check_install_runtime.make
cmt_final_setup_BesEvtGen_check_install_runtime = $(bin)TestRelease_BesEvtGen_check_install_runtimesetup.make
cmt_local_BesEvtGen_check_install_runtime_makefile = $(bin)BesEvtGen_check_install_runtime.make
endif

BesEvtGen_check_install_runtime_extratags = -tag_add=target_BesEvtGen_check_install_runtime

#$(cmt_local_tagfile_BesEvtGen_check_install_runtime) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_BesEvtGen_check_install_runtime) ::
else
$(cmt_local_tagfile_BesEvtGen_check_install_runtime) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_BesEvtGen_check_install_runtime)"
	@if test -f $(cmt_local_tagfile_BesEvtGen_check_install_runtime); then /bin/rm -f $(cmt_local_tagfile_BesEvtGen_check_install_runtime); fi ; \
	  $(cmtexe) -tag=$(tags) $(BesEvtGen_check_install_runtime_extratags) build tag_makefile >>$(cmt_local_tagfile_BesEvtGen_check_install_runtime); \
	  if test -f $(cmt_final_setup_BesEvtGen_check_install_runtime); then /bin/rm -f $(cmt_final_setup_BesEvtGen_check_install_runtime); fi; \
	  $(cmtexe) -tag=$(tags) $(BesEvtGen_check_install_runtime_extratags) show setup >>$(cmt_final_setup_BesEvtGen_check_install_runtime)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_BesEvtGen_check_install_runtime = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_BesEvtGen_check_install_runtime = /tmp/CMT_TestReleasesetup.make
cmt_local_BesEvtGen_check_install_runtime_makefile = /tmp/CMT_BesEvtGen_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_BesEvtGen_check_install_runtime = $(TestRelease_tag).make
cmt_local_tagfile_BesEvtGen_check_install_runtime = $(bin)$(TestRelease_tag).make
cmt_final_setup_BesEvtGen_check_install_runtime = $(bin)TestReleasesetup.make
cmt_local_BesEvtGen_check_install_runtime_makefile = $(bin)BesEvtGen_check_install_runtime.make
endif

endif

ifndef QUICK
$(cmt_local_BesEvtGen_check_install_runtime_makefile) :: $(BesEvtGen_check_install_runtime_dependencies) $(cmt_local_tagfile_BesEvtGen_check_install_runtime) build_library_links dirs
else
$(cmt_local_BesEvtGen_check_install_runtime_makefile) :: $(cmt_local_tagfile_BesEvtGen_check_install_runtime)
endif
	$(echo) "(constituents.make) Building BesEvtGen_check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(BesEvtGen_check_install_runtime_extratags) build constituent_makefile -out=$(cmt_local_BesEvtGen_check_install_runtime_makefile) BesEvtGen_check_install_runtime

BesEvtGen_check_install_runtime :: $(BesEvtGen_check_install_runtime_dependencies) $(cmt_local_BesEvtGen_check_install_runtime_makefile)
	$(echo) "(constituents.make) Creating BesEvtGen_check_install_runtime${lock_suffix} and Starting BesEvtGen_check_install_runtime"
	@${lock_command} BesEvtGen_check_install_runtime${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} BesEvtGen_check_install_runtime${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_BesEvtGen_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} BesEvtGen_check_install_runtime; \
	  retval=$$?; ${unlock_command} BesEvtGen_check_install_runtime${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) BesEvtGen_check_install_runtime done"

clean :: BesEvtGen_check_install_runtimeclean

BesEvtGen_check_install_runtimeclean :: $(BesEvtGen_check_install_runtimeclean_dependencies) ##$(cmt_local_BesEvtGen_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting BesEvtGen_check_install_runtimeclean"
	@-if test -f $(cmt_local_BesEvtGen_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_BesEvtGen_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} BesEvtGen_check_install_runtimeclean; \
	fi

##	  /bin/rm -f $(cmt_local_BesEvtGen_check_install_runtime_makefile) $(bin)BesEvtGen_check_install_runtime_dependencies.make

install :: BesEvtGen_check_install_runtimeinstall

BesEvtGen_check_install_runtimeinstall :: $(BesEvtGen_check_install_runtime_dependencies) $(cmt_local_BesEvtGen_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting install BesEvtGen_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_BesEvtGen_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install BesEvtGen_check_install_runtime done"

uninstall :: BesEvtGen_check_install_runtimeuninstall

BesEvtGen_check_install_runtimeuninstall :: $(cmt_local_BesEvtGen_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting uninstall BesEvtGen_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_BesEvtGen_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall BesEvtGen_check_install_runtime done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ BesEvtGen_check_install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ BesEvtGen_check_install_runtime done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_Bhwide_check_install_runtime_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_Bhwide_check_install_runtime_has_target_tag

ifdef READONLY
cmt_local_tagfile_Bhwide_check_install_runtime = /tmp/CMT_$(TestRelease_tag)_Bhwide_check_install_runtime.make$(cmt_lock_pid)
cmt_final_setup_Bhwide_check_install_runtime = /tmp/CMT_TestRelease_Bhwide_check_install_runtimesetup.make
cmt_local_Bhwide_check_install_runtime_makefile = /tmp/CMT_Bhwide_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_Bhwide_check_install_runtime = $(TestRelease_tag)_Bhwide_check_install_runtime.make
cmt_local_tagfile_Bhwide_check_install_runtime = $(bin)$(TestRelease_tag)_Bhwide_check_install_runtime.make
cmt_final_setup_Bhwide_check_install_runtime = $(bin)TestRelease_Bhwide_check_install_runtimesetup.make
cmt_local_Bhwide_check_install_runtime_makefile = $(bin)Bhwide_check_install_runtime.make
endif

Bhwide_check_install_runtime_extratags = -tag_add=target_Bhwide_check_install_runtime

#$(cmt_local_tagfile_Bhwide_check_install_runtime) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_Bhwide_check_install_runtime) ::
else
$(cmt_local_tagfile_Bhwide_check_install_runtime) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_Bhwide_check_install_runtime)"
	@if test -f $(cmt_local_tagfile_Bhwide_check_install_runtime); then /bin/rm -f $(cmt_local_tagfile_Bhwide_check_install_runtime); fi ; \
	  $(cmtexe) -tag=$(tags) $(Bhwide_check_install_runtime_extratags) build tag_makefile >>$(cmt_local_tagfile_Bhwide_check_install_runtime); \
	  if test -f $(cmt_final_setup_Bhwide_check_install_runtime); then /bin/rm -f $(cmt_final_setup_Bhwide_check_install_runtime); fi; \
	  $(cmtexe) -tag=$(tags) $(Bhwide_check_install_runtime_extratags) show setup >>$(cmt_final_setup_Bhwide_check_install_runtime)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_Bhwide_check_install_runtime = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_Bhwide_check_install_runtime = /tmp/CMT_TestReleasesetup.make
cmt_local_Bhwide_check_install_runtime_makefile = /tmp/CMT_Bhwide_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_Bhwide_check_install_runtime = $(TestRelease_tag).make
cmt_local_tagfile_Bhwide_check_install_runtime = $(bin)$(TestRelease_tag).make
cmt_final_setup_Bhwide_check_install_runtime = $(bin)TestReleasesetup.make
cmt_local_Bhwide_check_install_runtime_makefile = $(bin)Bhwide_check_install_runtime.make
endif

endif

ifndef QUICK
$(cmt_local_Bhwide_check_install_runtime_makefile) :: $(Bhwide_check_install_runtime_dependencies) $(cmt_local_tagfile_Bhwide_check_install_runtime) build_library_links dirs
else
$(cmt_local_Bhwide_check_install_runtime_makefile) :: $(cmt_local_tagfile_Bhwide_check_install_runtime)
endif
	$(echo) "(constituents.make) Building Bhwide_check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(Bhwide_check_install_runtime_extratags) build constituent_makefile -out=$(cmt_local_Bhwide_check_install_runtime_makefile) Bhwide_check_install_runtime

Bhwide_check_install_runtime :: $(Bhwide_check_install_runtime_dependencies) $(cmt_local_Bhwide_check_install_runtime_makefile)
	$(echo) "(constituents.make) Creating Bhwide_check_install_runtime${lock_suffix} and Starting Bhwide_check_install_runtime"
	@${lock_command} Bhwide_check_install_runtime${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} Bhwide_check_install_runtime${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_Bhwide_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} Bhwide_check_install_runtime; \
	  retval=$$?; ${unlock_command} Bhwide_check_install_runtime${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) Bhwide_check_install_runtime done"

clean :: Bhwide_check_install_runtimeclean

Bhwide_check_install_runtimeclean :: $(Bhwide_check_install_runtimeclean_dependencies) ##$(cmt_local_Bhwide_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting Bhwide_check_install_runtimeclean"
	@-if test -f $(cmt_local_Bhwide_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_Bhwide_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} Bhwide_check_install_runtimeclean; \
	fi

##	  /bin/rm -f $(cmt_local_Bhwide_check_install_runtime_makefile) $(bin)Bhwide_check_install_runtime_dependencies.make

install :: Bhwide_check_install_runtimeinstall

Bhwide_check_install_runtimeinstall :: $(Bhwide_check_install_runtime_dependencies) $(cmt_local_Bhwide_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting install Bhwide_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_Bhwide_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install Bhwide_check_install_runtime done"

uninstall :: Bhwide_check_install_runtimeuninstall

Bhwide_check_install_runtimeuninstall :: $(cmt_local_Bhwide_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting uninstall Bhwide_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_Bhwide_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall Bhwide_check_install_runtime done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ Bhwide_check_install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ Bhwide_check_install_runtime done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_Babayaga_check_install_runtime_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_Babayaga_check_install_runtime_has_target_tag

ifdef READONLY
cmt_local_tagfile_Babayaga_check_install_runtime = /tmp/CMT_$(TestRelease_tag)_Babayaga_check_install_runtime.make$(cmt_lock_pid)
cmt_final_setup_Babayaga_check_install_runtime = /tmp/CMT_TestRelease_Babayaga_check_install_runtimesetup.make
cmt_local_Babayaga_check_install_runtime_makefile = /tmp/CMT_Babayaga_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_Babayaga_check_install_runtime = $(TestRelease_tag)_Babayaga_check_install_runtime.make
cmt_local_tagfile_Babayaga_check_install_runtime = $(bin)$(TestRelease_tag)_Babayaga_check_install_runtime.make
cmt_final_setup_Babayaga_check_install_runtime = $(bin)TestRelease_Babayaga_check_install_runtimesetup.make
cmt_local_Babayaga_check_install_runtime_makefile = $(bin)Babayaga_check_install_runtime.make
endif

Babayaga_check_install_runtime_extratags = -tag_add=target_Babayaga_check_install_runtime

#$(cmt_local_tagfile_Babayaga_check_install_runtime) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_Babayaga_check_install_runtime) ::
else
$(cmt_local_tagfile_Babayaga_check_install_runtime) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_Babayaga_check_install_runtime)"
	@if test -f $(cmt_local_tagfile_Babayaga_check_install_runtime); then /bin/rm -f $(cmt_local_tagfile_Babayaga_check_install_runtime); fi ; \
	  $(cmtexe) -tag=$(tags) $(Babayaga_check_install_runtime_extratags) build tag_makefile >>$(cmt_local_tagfile_Babayaga_check_install_runtime); \
	  if test -f $(cmt_final_setup_Babayaga_check_install_runtime); then /bin/rm -f $(cmt_final_setup_Babayaga_check_install_runtime); fi; \
	  $(cmtexe) -tag=$(tags) $(Babayaga_check_install_runtime_extratags) show setup >>$(cmt_final_setup_Babayaga_check_install_runtime)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_Babayaga_check_install_runtime = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_Babayaga_check_install_runtime = /tmp/CMT_TestReleasesetup.make
cmt_local_Babayaga_check_install_runtime_makefile = /tmp/CMT_Babayaga_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_Babayaga_check_install_runtime = $(TestRelease_tag).make
cmt_local_tagfile_Babayaga_check_install_runtime = $(bin)$(TestRelease_tag).make
cmt_final_setup_Babayaga_check_install_runtime = $(bin)TestReleasesetup.make
cmt_local_Babayaga_check_install_runtime_makefile = $(bin)Babayaga_check_install_runtime.make
endif

endif

ifndef QUICK
$(cmt_local_Babayaga_check_install_runtime_makefile) :: $(Babayaga_check_install_runtime_dependencies) $(cmt_local_tagfile_Babayaga_check_install_runtime) build_library_links dirs
else
$(cmt_local_Babayaga_check_install_runtime_makefile) :: $(cmt_local_tagfile_Babayaga_check_install_runtime)
endif
	$(echo) "(constituents.make) Building Babayaga_check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(Babayaga_check_install_runtime_extratags) build constituent_makefile -out=$(cmt_local_Babayaga_check_install_runtime_makefile) Babayaga_check_install_runtime

Babayaga_check_install_runtime :: $(Babayaga_check_install_runtime_dependencies) $(cmt_local_Babayaga_check_install_runtime_makefile)
	$(echo) "(constituents.make) Creating Babayaga_check_install_runtime${lock_suffix} and Starting Babayaga_check_install_runtime"
	@${lock_command} Babayaga_check_install_runtime${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} Babayaga_check_install_runtime${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_Babayaga_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} Babayaga_check_install_runtime; \
	  retval=$$?; ${unlock_command} Babayaga_check_install_runtime${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) Babayaga_check_install_runtime done"

clean :: Babayaga_check_install_runtimeclean

Babayaga_check_install_runtimeclean :: $(Babayaga_check_install_runtimeclean_dependencies) ##$(cmt_local_Babayaga_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting Babayaga_check_install_runtimeclean"
	@-if test -f $(cmt_local_Babayaga_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_Babayaga_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} Babayaga_check_install_runtimeclean; \
	fi

##	  /bin/rm -f $(cmt_local_Babayaga_check_install_runtime_makefile) $(bin)Babayaga_check_install_runtime_dependencies.make

install :: Babayaga_check_install_runtimeinstall

Babayaga_check_install_runtimeinstall :: $(Babayaga_check_install_runtime_dependencies) $(cmt_local_Babayaga_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting install Babayaga_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_Babayaga_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install Babayaga_check_install_runtime done"

uninstall :: Babayaga_check_install_runtimeuninstall

Babayaga_check_install_runtimeuninstall :: $(cmt_local_Babayaga_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting uninstall Babayaga_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_Babayaga_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall Babayaga_check_install_runtime done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ Babayaga_check_install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ Babayaga_check_install_runtime done"
endif


#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_RunEventNumberAlg_check_install_runtime_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_RunEventNumberAlg_check_install_runtime_has_target_tag

ifdef READONLY
cmt_local_tagfile_RunEventNumberAlg_check_install_runtime = /tmp/CMT_$(TestRelease_tag)_RunEventNumberAlg_check_install_runtime.make$(cmt_lock_pid)
cmt_final_setup_RunEventNumberAlg_check_install_runtime = /tmp/CMT_TestRelease_RunEventNumberAlg_check_install_runtimesetup.make
cmt_local_RunEventNumberAlg_check_install_runtime_makefile = /tmp/CMT_RunEventNumberAlg_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_RunEventNumberAlg_check_install_runtime = $(TestRelease_tag)_RunEventNumberAlg_check_install_runtime.make
cmt_local_tagfile_RunEventNumberAlg_check_install_runtime = $(bin)$(TestRelease_tag)_RunEventNumberAlg_check_install_runtime.make
cmt_final_setup_RunEventNumberAlg_check_install_runtime = $(bin)TestRelease_RunEventNumberAlg_check_install_runtimesetup.make
cmt_local_RunEventNumberAlg_check_install_runtime_makefile = $(bin)RunEventNumberAlg_check_install_runtime.make
endif

RunEventNumberAlg_check_install_runtime_extratags = -tag_add=target_RunEventNumberAlg_check_install_runtime

#$(cmt_local_tagfile_RunEventNumberAlg_check_install_runtime) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_RunEventNumberAlg_check_install_runtime) ::
else
$(cmt_local_tagfile_RunEventNumberAlg_check_install_runtime) :
endif
	$(echo) "(constituents.make) Rebuilding setup.make $(cmt_local_tagfile_RunEventNumberAlg_check_install_runtime)"
	@if test -f $(cmt_local_tagfile_RunEventNumberAlg_check_install_runtime); then /bin/rm -f $(cmt_local_tagfile_RunEventNumberAlg_check_install_runtime); fi ; \
	  $(cmtexe) -tag=$(tags) $(RunEventNumberAlg_check_install_runtime_extratags) build tag_makefile >>$(cmt_local_tagfile_RunEventNumberAlg_check_install_runtime); \
	  if test -f $(cmt_final_setup_RunEventNumberAlg_check_install_runtime); then /bin/rm -f $(cmt_final_setup_RunEventNumberAlg_check_install_runtime); fi; \
	  $(cmtexe) -tag=$(tags) $(RunEventNumberAlg_check_install_runtime_extratags) show setup >>$(cmt_final_setup_RunEventNumberAlg_check_install_runtime)
	$(echo) setup.make ok

else

ifdef READONLY
cmt_local_tagfile_RunEventNumberAlg_check_install_runtime = /tmp/CMT_$(TestRelease_tag).make$(cmt_lock_pid)
cmt_final_setup_RunEventNumberAlg_check_install_runtime = /tmp/CMT_TestReleasesetup.make
cmt_local_RunEventNumberAlg_check_install_runtime_makefile = /tmp/CMT_RunEventNumberAlg_check_install_runtime$(cmt_lock_pid).make
else
#cmt_local_tagfile_RunEventNumberAlg_check_install_runtime = $(TestRelease_tag).make
cmt_local_tagfile_RunEventNumberAlg_check_install_runtime = $(bin)$(TestRelease_tag).make
cmt_final_setup_RunEventNumberAlg_check_install_runtime = $(bin)TestReleasesetup.make
cmt_local_RunEventNumberAlg_check_install_runtime_makefile = $(bin)RunEventNumberAlg_check_install_runtime.make
endif

endif

ifndef QUICK
$(cmt_local_RunEventNumberAlg_check_install_runtime_makefile) :: $(RunEventNumberAlg_check_install_runtime_dependencies) $(cmt_local_tagfile_RunEventNumberAlg_check_install_runtime) build_library_links dirs
else
$(cmt_local_RunEventNumberAlg_check_install_runtime_makefile) :: $(cmt_local_tagfile_RunEventNumberAlg_check_install_runtime)
endif
	$(echo) "(constituents.make) Building RunEventNumberAlg_check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(RunEventNumberAlg_check_install_runtime_extratags) build constituent_makefile -out=$(cmt_local_RunEventNumberAlg_check_install_runtime_makefile) RunEventNumberAlg_check_install_runtime

RunEventNumberAlg_check_install_runtime :: $(RunEventNumberAlg_check_install_runtime_dependencies) $(cmt_local_RunEventNumberAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Creating RunEventNumberAlg_check_install_runtime${lock_suffix} and Starting RunEventNumberAlg_check_install_runtime"
	@${lock_command} RunEventNumberAlg_check_install_runtime${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} RunEventNumberAlg_check_install_runtime${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_RunEventNumberAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} RunEventNumberAlg_check_install_runtime; \
	  retval=$$?; ${unlock_command} RunEventNumberAlg_check_install_runtime${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) RunEventNumberAlg_check_install_runtime done"

clean :: RunEventNumberAlg_check_install_runtimeclean

RunEventNumberAlg_check_install_runtimeclean :: $(RunEventNumberAlg_check_install_runtimeclean_dependencies) ##$(cmt_local_RunEventNumberAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting RunEventNumberAlg_check_install_runtimeclean"
	@-if test -f $(cmt_local_RunEventNumberAlg_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_RunEventNumberAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} RunEventNumberAlg_check_install_runtimeclean; \
	fi

##	  /bin/rm -f $(cmt_local_RunEventNumberAlg_check_install_runtime_makefile) $(bin)RunEventNumberAlg_check_install_runtime_dependencies.make

install :: RunEventNumberAlg_check_install_runtimeinstall

RunEventNumberAlg_check_install_runtimeinstall :: $(RunEventNumberAlg_check_install_runtime_dependencies) $(cmt_local_RunEventNumberAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting install RunEventNumberAlg_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_RunEventNumberAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} install
	$(echo) "(constituents.make) install RunEventNumberAlg_check_install_runtime done"

uninstall :: RunEventNumberAlg_check_install_runtimeuninstall

RunEventNumberAlg_check_install_runtimeuninstall :: $(cmt_local_RunEventNumberAlg_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting uninstall RunEventNumberAlg_check_install_runtime"
	@-$(MAKE) -f $(cmt_local_RunEventNumberAlg_check_install_runtime_makefile) cmt_lock_pid=$${cmt_lock_pid} uninstall
	$(echo) "(constituents.make) uninstall RunEventNumberAlg_check_install_runtime done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ RunEventNumberAlg_check_install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ RunEventNumberAlg_check_install_runtime done"
endif


#-- end of constituent_lock ------

clean :: remove_library_links

remove_library_links ::
	@echo "Removing library links"; \
	  $(remove_library_links); \

makefilesclean ::
	@/bin/rm -f checkuses

#	/bin/rm -f *.make*

clean :: makefilesclean

binclean :: clean
	if test ! "$(bin)" = "./"; then /bin/rm -rf $(bin); fi

