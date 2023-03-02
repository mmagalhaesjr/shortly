import { db } from '../config/database.js';
import bcrypt from 'bcrypt';
import { v4 as uuid } from "uuid";
import dayjs from 'dayjs';

export async function register(req, res) {
    const { name, email, password } = req.body
    const date = dayjs().format('YYYY-MM-DD')
    const encryptedPassword = bcrypt.hashSync(password, 10);

    await db.query(`INSERT INTO users (name, email, password, created_at) VALUES ($1,$2, $3, $4)`, [name, email, encryptedPassword, date])
    res.status(201).send("Usuário cadastrado com sucesso!")
}



export async function login(req, res) {
    const date = dayjs().format('YYYY-MM-DD')


    try {
        const token = uuid()
        await db.query(`INSERT INTO sessions (user_id, token, created_at) VALUES ($1,$2, $3)`, [res.locals.userId, token, date])

        return res.status(200).send(token)
        console.log(token)

    } catch (error) {
        res.status(500).send(error.message)

    }

}