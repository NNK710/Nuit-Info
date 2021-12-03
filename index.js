const express = require('express')
const Routeur = require('./routes/SiteRoutes');
const chart = require('chart.js')

let app = express()
app.set('view engine', 'ejs')


app.use(express.urlencoded({
    extended: true
}))
app.use('/cssFiles', express.static(__dirname + '/style'));
app.use('/fonts', express.static(__dirname + '/style/fonts'));
app.use(Routeur)





app.listen(3000)