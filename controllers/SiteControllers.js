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

        //Affichage les sauveteurs
        Sauveteur_affichage: (req, res) => {
                siteModel.Sauveteur_affichage(function(lignes){
                        res.render("./listeSauveteur", {index : lignes});
                });
        },

        //Affichage les navires
        Navire_affichage: (req, res) => {
            siteModel.Navire_affichage(function(lignes){
                    res.render("./listeNavire", {index : lignes});
            });
        },

        //Affichage les récits
        Recit_affichage: (req, res) => {
            siteModel.Recit_affichage(function(lignes){
                    res.render("./listeRecit", {index : lignes});
            });
        },

        //Affichage les Decorations
        Decoration_affichage: (req, res) => {
            siteModel.Decoration_affichage(function(lignes){
                    res.render("./listeDecoration", {index : lignes});
            });
        },
        
        //Afficher page d'ajout de sauveteur
        AfficherAjoutSauveteur: (req,res)=>{
                res.render('./AjouterSauveteur')
        },
        
        //Ajouter un sauveteur dans la table
        ajouterSauveteur:(req,res)=>{

                let nom_sauv = req.body.nom
                let pre_sauv = req.body.prenom
                let date_naissance = req.body.date_naissance
                let date_mort = req.body.date_mort
                let métier = req.body.métier
                let décoration = req.body.décoration

                siteModel.InsererSauveteur(nom_sauv,pre_sauv,date_naissance,date_mort,métier,décoration,res)
                res.redirect('/listeSauveteur')
        },
        //Affichage profile sauveteur
        ProfileSauveteur:(req,res)=>{
                id = req.params.id
                
                siteModel.getSauveteur(function(data){
                        siteModel.getDecoration(function(data2){
                                console.log(data)
                                
                                console.log(data2)
                                truc = data2
                                res.render('profile.ejs',{data: data, decoration: truc})
                                
                        })
                })
               
              

                
        }
}