SELECT h.hid ,h.address,u.uid,u.cname FROM `live` AS l
Right JOIN `house` AS h ON h.hid = l.hid
Right JOIN `userinfo` AS u ON l.uid = u.uid
WHERE h.hid is not null
ORDER BY h.hid