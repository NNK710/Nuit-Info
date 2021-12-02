//Importation de la connexion à la bdd
var db = require('../database')

//Exportation du model mysql (requêtes...)
module.exports={

    Sauveteur_affichage:function(callback){
    
        var sql='SELECT nomSauv, prenomSauv FROM sauveteur';
        db.query(sql, function (err, data, fields){
            console.log(err)
            if (err) throw err;
            return callback(data);
        });
        
    },InsererSauveteur : (nom_sauv,pre_sauv,date_naissance,date_mort,métier,res) =>{
        let requeteSQL = "INSERT INTO sauveteur (nomSauv, prenomSauv, naissanceSauv, mortSAUV,metierSauv) VALUES "
        requeteSQL = requeteSQL + ' ("' + nom_sauv + '","' + pre_sauv + '","' + date_naissance + '","' + date_mort + '","' + métier +'")'
        db.query(requeteSQL, (err, lignes) => {
            if (!err) {
                 
                
            } else {
                 
                res.send("Erreur ajout : " + JSON.stringify(err))
            }
        })
      }
}
