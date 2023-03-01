import { db } from '../config/database.js';
import bcrypt from 'bcrypt';

export async function validateUser(req, res, next) {
    const { email } = req.body
    
    try {
        const duplicateRecord = await db.query(`SELECT (email) FROM users  WHERE  email = $1`, [email])
        if (duplicateRecord.rows[0]) return res.status(409).send('Usuário já cadastrado!')

        next()

    } catch (error) {
        return res.sendStatus(500);
    }

}


export async function validateLogin(req, res, next) {
    const { email, password } = req.body

    try {
        const user = await db.query(`SELECT * FROM users WHERE email = $1`, [email])
        if (!user.rows[0]) return res.status(422).send('Email ou Senha invalidos!')



        const passwordOk = bcrypt.compareSync(password, user.rows[0].password)
        if (!passwordOk) return res.status(400).send("Email ou senha inválidos")

        res.locals.userId = user.rows[0].id



        next()

    } catch (error) {
        return res.sendStatus(500);
    }


}
