import { Router } from "express";
import { login, register } from "../controller/conect.controller.js";

const signUpIn= Router();


//cadastrar
signUpIn.post('/signup', register)

//logar
signUpIn.post('/signin', login)




export default signUpIn


