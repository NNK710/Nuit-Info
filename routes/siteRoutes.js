const { Router } = require('express');
const express = require('express');
const routeur = express.Router();

const Controle = require('../controllers/SiteControllers');

routeur.get('/', Controle.accueil);

module.exports = routeur;