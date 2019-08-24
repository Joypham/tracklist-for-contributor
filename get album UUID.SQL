Step 1: Get albumuuid from crawling task:

Select * from (Select trim(SUBSTRING_INDEX(Ext ->> '$.error_message',':',-1)) as albumuuid,TaskDetail ->>'$.album_id' as ituneid from crawlingtasks
where crawlingtasks.Priority = 98
and
crawlingtasks.CreatedAt like '2019-08-21%'
and 
actionid = '9C8473C36E57472281A1C7936108FC06') as t1

UNION ALL

Select * from (select ext ->> '$.album_uuid',TaskDetail ->>'$.album_id' as ituneid from crawlingtask_done
where 
crawlingtask_done.CreatedAt like '2019-08-21%'
and 
crawlingtask_done.actionid = '9C8473C36E57472281A1C7936108FC06') as t1

UNION ALL

Select * from (Select trim(SUBSTRING_INDEX(Ext ->> '$.error_message',':',-1)),TaskDetail ->>'$.album_id' as ituneid from crawlingtasks
where crawlingtasks.Priority = 99
and
crawlingtasks.CreatedAt like '2019-08-22%'
and 
actionid = '9C8473C36E57472281A1C7936108FC06') as t1
UNION ALL

Select * from (select ext ->> '$.album_uuid',TaskDetail ->>'$.album_id' as ituneid from crawlingtask_done
where 
crawlingtask_done.CreatedAt like '2019-08-22%'
and 
crawlingtask_done.actionid = '9C8473C36E57472281A1C7936108FC06') as t1
