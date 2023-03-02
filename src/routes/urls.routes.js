import { Router } from "express";
import { deleteId, getUrlById, openShortUrl, shorten } from "../controller/urls.controller.js";
import { validateToken } from "../middlewares/validateToken.js";
import { urlSchema } from "../schemas/schemas.js";
import { validateSchema } from '../middlewares/validateSchema.js';


const urlsRoutes = Router();



urlsRoutes.post('/urls/shorten',validateSchema(urlSchema), validateToken, shorten)

urlsRoutes.get('/urls/:id',getUrlById)

urlsRoutes.get('/urls/open/:shortUrl', openShortUrl)

urlsRoutes.delete('/urls/:id',validateToken, deleteId)






export default urlsRoutes
