import { Router } from "express";
import { getUrlByUser, ranking } from "../controller/users.controller.js";
import { validateToken } from '../middlewares/validateToken.js';



const userRoutes = Router();



userRoutes.get('/users/me',validateToken, getUrlByUser)

userRoutes.get('/ranking',ranking)






export default userRoutes