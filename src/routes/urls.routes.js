import { Router } from "express";
import { deleteId, id, openShortUrl, Shorten } from "../controller/urls.controller";


const urls= Router();



urls.post('/urls/shorten', Shorten)

urls.get('/urls/:id',id)

urls.get('/urls/open/:shortUrl',openShortUrl)

urls.delete('/urls/:id',deleteId)






export default urls
