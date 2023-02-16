import { Router } from "express";
import { ranking, usersMe } from "../controller/users.controller";



const user= Router();



user.get('/users/me',usersMe)

user.get('/ranking',ranking)






export default user