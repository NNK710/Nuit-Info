const { Router } = require('express');
const express = require('express');
const routeur = express.Router();

const Controle = require('../controllers/SiteControllers');


routeur.get('/', Controle.accueil);

routeur.get('/listeSauveteur', Controle.Sauveteur_affichage);

module.exports = routeur;