import { Router } from "express";
import { deleteId, getUrlById, openShortUrl, shorten } from "../controller/urls.controller.js";
import { validateToken } from "../middlewares/validateToken.js";
import { urlSchema } from "../schemas/schemas.js";
import { validateSchema } from '../middlewares/validateSchema.js';
import { verifyShortUrl, verifyUrlDelete } from '../middlewares/url.middleware.js';
import { verifyUrlById } from '../middlewares/url.middleware.js';


const urlsRoutes = Router();



urlsRoutes.post('/urls/shorten',validateSchema(urlSchema), validateToken, shorten)

urlsRoutes.get('/urls/:id',verifyUrlById, getUrlById)

urlsRoutes.get('/urls/open/:shortUrl', verifyShortUrl, openShortUrl)

urlsRoutes.delete('/urls/:id',validateToken,verifyUrlDelete, deleteId)






export default urlsRoutes
