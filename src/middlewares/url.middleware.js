import { db } from '../config/database.js';




export async function verifyShortUrl(req, res, next){
    const shortUrl = req.params.shortUrl

    try {
        const urlData = await db.query(`SELECT * FROM urls WHERE "shortUrl" = $1`,[shortUrl])

        if(!urlData.rows[0]){
            return res.sendStatus(404)
        }

        res.locals.urlData = urlData

        next()
       
        
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function verifyUrlById(req,res,next){
    const { id } = req.params

    try {

        const urlData = await db.query(`SELECT id,"shortUrl", url  FROM urls WHERE id = $1`, [id]);

        const obj = urlData.rows[0];

        if (!obj) {

           return res.sendStatus(404)
        }

        res.locals.obj = obj

        next()

       


    } catch (error) {
        res.status(500).send(error.message)
    }

}
 
export async function verifyUrlDelete(req,res,next){

   
const {id} = req.params;


const {rows}  = await db.query(`SELECT id,"userId" FROM urls WHERE id = $1`,[id]);
const urlData = rows[0];

if(!urlData){
    return res.sendStatus(404);
}


if(urlData.userId !== res.locals.userId){
    return res.sendStatus(401);
}
   res.locals.id = id;

    next();


}

