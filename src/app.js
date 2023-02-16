import express  from "express";
import cors from "cors";
import dotenv from "dotenv";

dotenv.config()
const app = express()
app.use(cors())
app.use(express.json())

const PORTA = process.env.PORTA
app.listen(PORTA, () => console.log(`***Servidor rodando na porta: ${PORTA}`))