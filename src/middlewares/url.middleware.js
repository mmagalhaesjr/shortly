import { db } from '../config/database.js';

export async function verifyUrlById(){

}


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