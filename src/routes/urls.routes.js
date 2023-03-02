import { Router } from "express";
import { deleteId, getUrlById, openShortUrl, shorten } from "../controller/urls.controller.js";
import { validateToken } from "../middlewares/validateToken.js";
import { urlSchema } from "../schemas/schemas.js";
import { validateSchema } from '../middlewares/validateSchema.js';
import { verifyShortUrl } from '../middlewares/url.middleware.js';


const urlsRoutes = Router();



urlsRoutes.post('/urls/shorten',validateSchema(urlSchema), validateToken, shorten)

urlsRoutes.get('/urls/:id',getUrlById)

urlsRoutes.get('/urls/open/:shortUrl', verifyShortUrl, openShortUrl)

urlsRoutes.delete('/urls/:id',validateToken, deleteId)






export default urlsRoutes
