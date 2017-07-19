h1b = load '/user/hive/warehouse/h1b.db/h1b_final' using PigStorage('\t') as (s_no:int,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage:double,year:int,worksite:chararray,longitute:double,latitute:double);

dis =foreach h1b generate worksite,case_status,year;
fil2012 = FILTER dis by case_status == 'CERTIFIED' or case_status == 'CERTIFIED-WITHDRAWN';
grp2012 = group fil2012 by (worksite,year);
cunt2012 = foreach grp2012 generate group,COUNT(fil2012.$0) as mostData;
odr2012 = ORDER cunt2012 by $1 desc;
lim2012 = LIMIT odr2012 5;

dis =foreach h1b generate worksite,case_status,year;
fil2013 = FILTER dis by case_status == 'CERTIFIED' or case_status == 'CERTIFIED-WITHDRAWN';
grp2013 = group fil2013 by (worksite,year);
cunt2013 = foreach grp2013 generate group,COUNT(fil2013.$0) as mostData;
odr2013 = ORDER cunt2013 by $1 desc;
lim2013 = LIMIT odr2013 5;


dis =foreach h1b generate worksite,case_status,year;
fil2014 = FILTER dis by case_status == 'CERTIFIED' or case_status == 'CERTIFIED-WITHDRAWN';
grp2014 = group fil2014 by (worksite,year);
cunt2014 = foreach grp2014 generate group,COUNT(fil2014.$0) as mostData;
odr2014 = ORDER cunt2014 by $1 desc;
lim2014 = LIMIT odr2014 5;


dis =foreach h1b generate worksite,case_status,year;
fil2015 = FILTER dis by case_status == 'CERTIFIED' or case_status == 'CERTIFIED-WITHDRAWN';
grp2015 = group fil2015 by (worksite,year);
cunt2015 = foreach grp2015 generate group,COUNT(fil2015.$0) as mostData;
odr2015 = ORDER cunt2015 by $1 desc;
lim2015 = LIMIT odr2015 5;


dis =foreach h1b generate worksite,case_status,year;
fil2016 = FILTER dis by case_status == 'CERTIFIED' or case_status == 'CERTIFIED-WITHDRAWN';
grp2016 = group fil2016 by (worksite,year);
cunt2016 = foreach grp2016 generate group,COUNT(fil2016.$0) as mostData;
odr2016 = ORDER cunt2016 by $1 desc;
lim2016 = LIMIT odr2016 5;
