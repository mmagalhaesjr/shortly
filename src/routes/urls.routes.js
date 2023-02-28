import { Router } from "express";
import { deleteId, getUrlById, openShortUrl, shorten } from "../controller/urls.controller.js";


const urlsRoutes = Router();



urlsRoutes.post('/urls/shorten', shorten)

urlsRoutes.get('/urls/:id',getUrlById)

urlsRoutes.get('/urls/open/:shortUrl', openShortUrl)

urlsRoutes.delete('/urls/:id',deleteId)






export default urlsRoutes
