import { Pool } from "pg";

export const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "attendance_db",
  password: "password",
  port: 5432
});
