import { Router } from "express";
import { deleteId, getUrlById, openShortUrl, shorten } from "../controller/urls.controller.js";
import { validateToken } from "../middlewares/validateToken.js";


const urlsRoutes = Router();



urlsRoutes.post('/urls/shorten', validateToken, shorten)

urlsRoutes.get('/urls/:id',getUrlById)

urlsRoutes.get('/urls/open/:shortUrl', openShortUrl)

urlsRoutes.delete('/urls/:id',validateToken, deleteId)






export default urlsRoutes
