import express  from "express";
import cors from "cors";
import dotenv from "dotenv";
import authRoutes from "./routes/auth.routes.js";
import urlsRoutes from './routes/urls.routes.js';
import userRoutes from "./routes/users.routes.js";

dotenv.config()
const app = express()
app.use(cors())
app.use(express.json())


app.use([authRoutes, urlsRoutes, userRoutes])

const PORTA = 5000 || process.env.PORTA 
app.listen(PORTA, () => console.log(`***Servidor rodando na porta: ${PORTA}`))



