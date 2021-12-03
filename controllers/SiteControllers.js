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
        }, AfficherAjoutSauveteur: (req,res)=>{
                res.render('./AjouterSauveteur')
        },
        
        //Ajouter sauveuteur dans la table
        ajouterSauveteur:(req,res)=>{

                let nom_sauv = req.body.nom
                let pre_sauv = req.body.prenom
                let date_naissance = req.body.date_naissance
                let date_mort = req.body.date_mort
                let métier = req.body.métier
                let décoration = req.body.décoration
                siteModel.InsererSauveteur(nom_sauv,pre_sauv,date_naissance,date_mort,métier,décoration,res)
                res.redirect('/listeSauveteur')
        }
}