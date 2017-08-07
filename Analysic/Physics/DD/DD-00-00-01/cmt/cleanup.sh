# echo "cleanup DD DD-00-00-01 in /afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/Analysic/Physics"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtDDtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtDDtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=DD -version=DD-00-00-01 -path=/afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/Analysic/Physics  $* >${cmtDDtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=DD -version=DD-00-00-01 -path=/afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/Analysic/Physics  $* >${cmtDDtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtDDtempfile}
  unset cmtDDtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtDDtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtDDtempfile}
unset cmtDDtempfile
return $cmtcleanupstatus

