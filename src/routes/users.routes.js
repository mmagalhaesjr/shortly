import { Router } from "express";
import { getUrlByUser, ranking } from "../controller/users.controller.js";



const userRoutes = Router();



userRoutes.get('/users/me',getUrlByUser)

userRoutes.get('/ranking',ranking)






export default userRoutes