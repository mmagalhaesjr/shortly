import { db } from '../config/database.js';
import bcrypt from 'bcrypt';
import { v4 as uuid } from "uuid";
import dayjs from 'dayjs';

export async function register(req, res) {
    const { name, email, password } = req.body
    const encryptedPassword = bcrypt.hashSync(password, 10);

    await db.query(`INSERT INTO users (name, email, password) VALUES ($1,$2, $3)`, [name, email, encryptedPassword])
    res.status(201).send("Usuário cadastrado com sucesso!")
}



export async function login(req, res) {
    const date = dayjs().format('YYYY-MM-DD')


    try {
        const token = uuid()
        await db.query(`INSERT INTO sessions (user_id, token) VALUES ($1,$2)`, [res.locals.userId, token])

        return res.status(200).send(token)
        console.log(token)

    } catch (error) {
        res.status(500).send(error.message)

    }

}