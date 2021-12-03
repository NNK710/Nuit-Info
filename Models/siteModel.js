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
    InsererSauveteur : (nom_sauv,pre_sauv,date_naissance,date_mort,métier,décoration,res) =>{
        let requeteSQL = "INSERT INTO sauveteur (nomSauv, prenomSauv, naissanceSauv, mortSAUV,metierSauv) VALUES "
        requeteSQL = requeteSQL + ' ("' + nom_sauv + '","' + pre_sauv + '","' + date_naissance + '","' + date_mort + '","' + métier +'")'
        db.query(requeteSQL, (err, lignes) => {
            if (!err) {

               
            for (let i=0;i<décoration.length;i++){
            
                LaDécoration = décoration[i]
                console.log(LaDécoration)

                db.query('SELECT idSauv FROM sauveteur WHERE nomSauv = "' + nom_sauv + '"AND prenomSauv = "'+pre_sauv +'" AND naissanceSauv ='+date_naissance, (err, lignes) => {
                    console.log('SELECT idSauv FROM sauveteur WHERE nomSauv = "' + nom_sauv + '"AND prenomSauv = "'+pre_sauv +'" AND naissanceSauv ='+date_naissance)
                    lignes.forEach(function (user) {
                        id_sauv = user.idSauv
                       
                        console.log('test')
                        db.query('INSERT INTO decoration(nomDeco) VALUES ("'+LaDécoration+'")', (err, lignes) => {
                            
                            db.query('SELECT idDecoration FROM decoration WHERE nomDeco = "' + LaDécoration + '"', (err, lignes) => {
                                lignes.forEach(function (user) {
                                    
                                    id_deco = user.nomDeco
                                    db.query('INSERT INTO alldeco(idDecoStrange,idSauvStrang) VALUES ('+id_deco+','+id_sauv+')', (err, lignes) => {
                                })
                            })
                        })

                    })
                })
                
            })

            }
                
            } else {
                 
                res.send("Erreur ajout : " + JSON.stringify(err))
            }
        })
    },

    Decoration_affichage:function(callback){
    
        var sql='SELECT nomDeco FROM decoration';
        db.query(sql, function (err, data, fields){
            console.log(err)
            if (err) throw err;
            return callback(data);
        });
        
    },

    Navire_affichage:function(callback){
    
        var sql='SELECT nomNavire, lienNavire FROM navire';
        db.query(sql, function (err, data, fields){
            console.log(err)
            if (err) throw err;
            return callback(data);
        });
        
    },    
}
