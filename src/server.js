const express = require('express')
const axios = require('axios')

const app = express()
const port = 3000;

const student = "Dawid Rutkowski"

console.log(`Serwer uruchomiony ${new Date().toISOString()}`)
console.log(`Autor: ${student}`)
console.log(`Serwer nasłuchuje na porcie ${port}`)

// Middleware do pobrania IP klienta i jego strefy czasowej
async function getIP(req, res, next) {
  try {
    // Pobranie adresu IP klienta
    const ip_res = await axios.get('https://api.ipify.org?format=json')
    const ip_stud = ip_res.data.ip

    // Przekazanie IP do następnego middleware
    req.ip_stud = ip_stud;
    next();
  } catch (error) {
    console.error(error);
    res.status(500).send("error ip");
  }
}

// Middleware do pobrania strefy czasowej klienta
async function getTimezone(req, res, next) {
  try {
    const ip_stud = req.ip_stud;
    // Pobranie informacji o strefie czasowej dla adresu IP klienta
    const timezone_res = await axios.get(`https://ipapi.co/${ip_stud}/timezone`)
    const timezone = timezone_res.data

    // Przekazanie strefy czasowej do następnego middleware
    req.timezone = timezone;
    next();
  } catch (error) {
    console.error(error);
    res.status(500).send('error timezone');
  }
}

// Główny procesor żądania
app.get('/', getIP, getTimezone, (req, res) => {
  try {
    const ip_stud = req.ip_stud;
    const timezone = req.timezone;

    // Uzyskanie daty i godziny w strefie czasowej klienta
    const time_stud = new Date().toLocaleString('pl-PL', { timezone: timezone });

    // Tworzenie odpowiedzi HTML
    const html_text = 
    ` <html><body>
      <h1>Data i godzina: ${time_stud}</h1>
      <h1>IP: ${ip_stud}</h1>
      </body></html>`

    res.send(html_text)
    
  } catch (error) {
    console.error(error);
    res.status(500).send('error response');
  }
});

app.listen(port, () => {
  console.log(`Serwer uruchomiono na porcie: ${port}`);
});
