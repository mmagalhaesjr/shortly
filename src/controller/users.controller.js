import { db } from '../config/database.js';


export async function getUrlByUser(req,res){
const id = res.locals.userId 


const {rows} = await db.query(`
SELECT json_build_object(
	'id', users.id,
	'name', users.name,
	'visitCount', SUM(urls."visitCount"),
	'shortenedUrls', json_agg(json_build_object(
		'id', urls.id,
		'shortUrl', urls."shortUrl",
		'url',urls.url,
		'visitCount',urls."visitCount"
	) )
)
FROM users
JOIN urls
ON users.id = urls."userId"
WHERE users.id = $1
GROUP BY users.id


`,[id])

const userUrls = rows[0].json_build_object

res.status(200).send(userUrls)

};

export async function ranking(req,res){
const {rows} = await db.query(`
SELECT json_build_object(
	'id', users.id,
	'name', users.name,
	'linksCount', (CASE WHEN total."linksCount" IS NOT NULL THEN total."linksCount" ELSE 0 END),
	'visitCount', (CASE WHEN total."visitCount" IS NOT NULL THEN total."visitCount" ELSE 0 END)
	) AS user_info

FROM users
LEFT JOIN urls ON users.id = urls."userId"
LEFT JOIN (
	SELECT urls."userId" as "userId", COUNT(*) as "linksCount", SUM(urls."visitCount") as "visitCount" 
	FROM urls 
	GROUP BY urls."userId"
) AS total ON total."userId" = users.id

GROUP BY users.id, total."visitCount", total."linksCount"

ORDER BY COALESCE(total."visitCount", 0) DESC, COALESCE(total."linksCount", 0) DESC, users.id DESC
LIMIT 10

`)

const result = rows.map( i => i.user_info )

res.status(200).send(result)
};