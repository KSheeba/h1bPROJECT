h1b = load '/user/hive/warehouse/h1b.db/h1b_final' using PigStorage('\t') as (s_no:int,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage:double,year:int,worksite:chararray,longitute:double,latitute:double);

dis = foreach h1b generate year,soc_name;
groupby = group dis by year;
cunt = foreach groupby generate $0,COUNT(dis.soc_name);
dump cunt;
