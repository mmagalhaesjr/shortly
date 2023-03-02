import pg from "pg";
import dotenv from "dotenv";

dotenv.config();

const { Pool } = pg;

const configDataBase = {
    connectionString: process.env.DATABASE_URL,
    ...(process.env.NODE_ENV === "production" && {
      ssl: {
        rejectUnauthorized: false,
      },
    }),
  };


export const db = new Pool(configDataBase);