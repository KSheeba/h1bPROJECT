h1b = load '/user/hive/warehouse/h1b.db/h1b_final' using PigStorage('\t') as (s_no:int,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage:double,year:int,worksite:chararray,longitute:double,latitute:double);

grp1 = group h1b ALL;
grp2 = foreach grp1 generate COUNT(h1b.soc_name)as totalApplications;

rec = foreach h1b generate job_title,case_status;
f_suc = FILTER rec by case_status == 'CERTIFIED' or case_status == 'CERTIFIED-WITHDRAWN';
rec1 = foreach f_suc generate job_title,case_status;
groupby = group rec1 by job_title;
coutofEmplye = foreach groupby generate $0,COUNT(rec1.case_status) as cerftifiedApplications;

d = foreach coutofEmplye generate $0,(cerftifiedApplications/(double)totalrec.totalApplications)*100;

odr = order d by $1 desc;
limit = LIMIT odr 10;
store limit into '/home/hduser/pig10.pig' using PigStorage('\t');

