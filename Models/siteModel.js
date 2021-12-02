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
        
    },
}
