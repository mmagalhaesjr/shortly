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

};