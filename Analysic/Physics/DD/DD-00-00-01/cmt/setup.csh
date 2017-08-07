# echo "setup DD DD-00-00-01 in /afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/Analysic/Physics"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtDDtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtDDtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=DD -version=DD-00-00-01 -path=/afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/Analysic/Physics  -no_cleanup $* >${cmtDDtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=DD -version=DD-00-00-01 -path=/afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/Analysic/Physics  -no_cleanup $* >${cmtDDtempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtDDtempfile}
  unset cmtDDtempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtDDtempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtDDtempfile}
unset cmtDDtempfile
exit $cmtsetupstatus

