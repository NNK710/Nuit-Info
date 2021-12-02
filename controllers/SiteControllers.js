//Importation de la connexion à la bdd
const bodyParser = require('body-parser');
const iniparser = require('iniparser');
var db = require('../database');
//Importation du fichier models
var siteModel = require('../models/siteModel');

//Exportation des fonctions du controller
module.exports = {

        // Redirection vers l'accueil
        accueil : (req, res) => {
                res.render("./acceuil");
        },

        //Affichage des sauveteur
        Sauveteur_affichage: (req, res) => {
                siteModel.Sauveteur_affichage(function(lignes){
                        res.render("./listeSauveteur", {index : lignes});
                });
        },
}