# echo "cleanup DD DD-00-00-02 in /afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/Analysic/Physics"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtDDtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtDDtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=DD -version=DD-00-00-02 -path=/afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/Analysic/Physics  $* >${cmtDDtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=DD -version=DD-00-00-02 -path=/afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/Analysic/Physics  $* >${cmtDDtempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtDDtempfile}
  unset cmtDDtempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtDDtempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtDDtempfile}
unset cmtDDtempfile
exit $cmtcleanupstatus

