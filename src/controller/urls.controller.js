import { nanoid } from 'nanoid';
import dayjs from 'dayjs';
import { db } from '../config/database.js';
import { query } from 'express';

export async function shorten(req, res) {
    const { url } = req.body;
    const shortUrl = nanoid(7)


    try {
        const resultQuery = await db.query(`INSERT INTO urls ("userId",url,"shortUrl","visitCount") VALUES ($1,$2,$3,$4) `, [res.locals.userId, url, shortUrl, 0])

        const { rows } = await db.query(`SELECT id, "shortUrl" FROM urls WHERE url = $1`, [url]);

        const id = rows[0];


        return res.status(201).send(id);

    } catch (error) {
        res.status(500).send(error.message)
    }

};

export async function getUrlById(req, res) {
    
        return res.status(200).send(res.locals.obj)

};

export async function openShortUrl(req, res) {
    const shortUrl = req.params.shortUrl
    
    try {
       
        const url = res.locals.urlData.rows[0].url

        await db.query(`UPDATE urls SET "visitCount" = "visitCount"+1 WHERE "shortUrl" = $1`, [shortUrl])

        return res.redirect(url)

        
    } catch (error) {
        res.status(500).send(error.message);
    }
};

export async function deleteId(req, res) {

   const id = res.locals.id;

   await db.query(`DELETE FROM urls WHERE id = $1`,[id])

   res.sendStatus(204);


}; 