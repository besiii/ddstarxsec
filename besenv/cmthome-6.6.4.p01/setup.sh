# echo "Setting standalone package"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/bes3/offline/ExternalLib/contrib/CMT/v1r20p20081118; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh

tempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then tempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=cmt_standalone -path=/afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/besenv/cmthome-6.6.4.p01  -no_cleanup $* >${tempfile}; . ${tempfile}
/bin/rm -f ${tempfile}

