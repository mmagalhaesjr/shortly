import { Router } from "express";
import { login, register } from "../controller/auth.controller.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { loginSchema, registerSchema } from "../schemas/schemas.js";
import { validateLogin, validateUser } from '../middlewares/authentication.middleware.js';


const authRoutes = Router();


//cadastrar
authRoutes.post('/signup',validateSchema(registerSchema), validateUser, register)

//logar
authRoutes.post('/signin',validateSchema(loginSchema), validateLogin, login)


export default authRoutes


