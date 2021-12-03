const { Router } = require('express');
const express = require('express');
const routeur = express.Router();

const Controle = require('../controllers/SiteControllers');


routeur.get('/', Controle.accueil);

routeur.get('/listeSauveteur', Controle.Sauveteur_affichage);

routeur.get('/EnregistrerSauveteur', Controle.AfficherAjoutSauveteur);

routeur.post('/ajouterSauveteur', Controle.ajouterSauveteur);
routeur.get('/AfficherProfile/:id', Controle.ProfileSauveteur);

routeur.get('/listeDecoration', Controle.Decoration_affichage);

routeur.get('/listeNavire', Controle.Navire_affichage);

routeur.get('/listeRecit', Controle.Recit_affichage);

module.exports = routeur;