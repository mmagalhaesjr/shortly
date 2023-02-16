import pkg from "pg";
import doteenv from "dotenv";

doteenv.config();

const {pool}= pkg;

export const db = new pool({
    connectionString: process.env.DATABASE_URL
});