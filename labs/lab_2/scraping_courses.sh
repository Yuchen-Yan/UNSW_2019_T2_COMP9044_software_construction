#!/bin/sh

program=$1
F=${1:0:1}

curl --silent "http://legacy.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=$F" \
              "http://legacy.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=$F" \
              |egrep $program \
              | egrep "handbook.unsw.edu.au" \
              | sed -e s/'<TD.*2018\/'//g \
              | sed -e s/'.html">'/' '/g \
              | sed -e s/' <\/A><\/TD>'//g \
              | sed -e s/'<\/A><\/TD>'//g \
              | uniq | sort \
              | sed -e s/'								'/''/g \
              | uniq
