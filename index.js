import express from "express";
import path from "path";
import fs from "fs";

const app = express();
const __dirname = process.cwd();

app.get("/", (req, res) => {
  const ip = req.ip;
  const pathfile = path.join(__dirname, "logs");
  fs.writeFile(pathfile + `/logs.txt`, ip, (err) => {
    if (err) {
      console.log(err);
    }
    res.sendFile(path.join(__dirname, "index.html"));
  });
});

app.listen(4000, () => {
  console.log("Server running on port 4000");
});
