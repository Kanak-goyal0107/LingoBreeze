const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());


const words = [
  {
    word: "Apple",
    meaning: "A fruit",
    translation: "Manzana"
  },
  {
    word: "Beautiful",
    meaning: "Pleasing to look at",
    translation: "Hermosa"
  },
  {
    word: "Friend",
    meaning: "A close companion",
    translation: "Amigo"
  },
  {
    word: "Water",
    meaning: "A liquid essential for life",
    translation: "Agua"
  }
];


app.get("/words", (req, res) => {
  res.status(200).json(words);
});

const PORT = 3000;

app.listen(PORT, () => {
  console.log(` Server Running On Port ${PORT}`);
});