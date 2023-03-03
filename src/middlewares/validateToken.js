import { db } from '../config/database.js';

export async function validateToken(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace('Bearer ', '');
 
  if(!token) return res.sendStatus(401)
  
  try {
    const session = await db.query(`SELECT "userId" FROM sessions WHERE token = $1`, [token]);

    if (!session.rows[0]) return res.sendStatus(401)
    
    res.locals.userId = session.rows[0].userId

    next();


  } catch (error) {

    return res.sendStatus(500);
  }

};