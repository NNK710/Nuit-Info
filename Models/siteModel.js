//Importation de la connexion à la bdd
var db = require('../database')

//Exportation du model mysql (requêtes...)
module.exports = {

    Sauveteur_affichage: function (callback) {

        var sql = 'SELECT nomSauv, prenomSauv,idSauv FROM sauveteur';
        db.query(sql, function (err, data, fields) {
            console.log(err)
            if (err) throw err;
            return callback(data);
        });

        //Insérer nouveau sauveteur
    }, InsererSauveteur: (nom_sauv, pre_sauv, date_naissance, date_mort, métier, décoration, res) => {
        let requeteSQL = "INSERT INTO sauveteur (nomSauv, prenomSauv, naissanceSauv, mortSAUV,metierSauv) VALUES "
        requeteSQL = requeteSQL + ' ("' + nom_sauv + '","' + pre_sauv + '","' + date_naissance + '","' + date_mort + '","' + métier + '")'
        db.query(requeteSQL, (err, lignes) => {
            if (!err) {

                db.query('SELECT idSauv FROM sauveteur WHERE nomSauv = "' + nom_sauv + '"AND prenomSauv = "' + pre_sauv + '" AND naissanceSauv ="' + date_naissance + '"', (err, lignes) => {

                    type = typeof décoration

                    if (type == "string") {
                        lignes.forEach(function (user) {

                            id_sauv = user.idSauv

                            db.query('SELECT idDecoration FROM decoration WHERE nomDeco = "' + décoration + '"', (err, lignes) => {
                                if (lignes != "") {
                                    lignes.forEach(function (user) {

                                        id_deco = user.idDecoration

                                    })
                                    db.query('INSERT INTO alldeco(idDecoStrange,idSauvStrange) VALUES (' + id_deco + ',' + id_sauv + ')', (err, lignes) => {
                                    })
                                }
                                else {
                                    db.query('INSERT INTO decoration(nomDeco) VALUES ("' + décoration + '")', (err, lignes) => {

                                        db.query('SELECT idDecoration FROM decoration WHERE nomDeco = "' + décoration + '"', (err, lignes) => {
                                            console.log(lignes)
                                            lignes.forEach(function (user) {

                                                id_deco = user.idDecoration

                                            })
                                            db.query('INSERT INTO alldeco(idDecoStrange,idSauvStrange) VALUES (' + id_deco + ',' + id_sauv + ')', (err, lignes) => {
                                            })
                                        })

                                    })

                                }
                            })




                        })
                    }
                    else {
                        lignes.forEach(function (user) {



                            id_sauv = user.idSauv
                            for (let i = 0; i < décoration.length; i++) {


                                db.query('SELECT idDecoration FROM decoration WHERE nomDeco = "' + décoration[i] + '"', (err, lignes) => {
                                    if (lignes != "") {
                                        lignes.forEach(function (user) {

                                            id_deco = user.idDecoration

                                        })
                                        db.query('INSERT INTO alldeco(idDecoStrange,idSauvStrange) VALUES (' + id_deco + ',' + id_sauv + ')', (err, lignes) => {
                                        })
                                    }
                                    else {
                                        db.query('INSERT INTO decoration(nomDeco) VALUES ("' + décoration[i] + '")', (err, lignes) => {

                                            db.query('SELECT idDecoration FROM decoration WHERE nomDeco = "' + décoration[i] + '"', (err, lignes) => {
                                                console.log(lignes)
                                                lignes.forEach(function (user) {

                                                    id_deco = user.idDecoration

                                                })
                                                db.query('INSERT INTO alldeco(idDecoStrange,idSauvStrange) VALUES (' + id_deco + ',' + id_sauv + ')', (err, lignes) => {
                                                })
                                            })
                                        })
                                    }
                                })
                            }
                        })

                    }

                })

            } else {

                res.send("Erreur ajout : " + JSON.stringify(err))
            }
        })

        //recupérer donnée sauveteur
    },getSauveteur:function(callback){
        
        db.query("SELECT DATE_FORMAT(naissanceSauv, '%d/%m/%Y') AS naissanceSauv, DATE_FORMAT(mortSauv, '%d/%m/%Y') AS mortSauv, nomSauv,prenomSauv,metierSauv FROM sauveteur WHERE idSauv = "+ id , (err, lignes) => {
            console.log(lignes)
            return callback(lignes)
    })
    //recupérer décoration sauveteur
    },getDecoration:function(callback){
        var decorations = []
        db.query('SELECT idDecoStrange FROM alldeco WHERE idSauvStrange = '+ id , (err, lignes) => {
            lignes.forEach(function(user){
                console.log(lignes)
                
                db.query('SELECT nomDeco FROM decoration WHERE idDecoration = '+ user.idDecoStrange , (err, lignes) => {
                    console.log('SELECT nomDecoration FROM decoration WHERE idDecoration = '+ user.idDecoStrange+'')
                    lignes.forEach(function(user){
                        
                        decorations.push(user.nomDeco)
                    })

                    return callback(decorations)
            })
        })
    })
    }, Decoration_affichage:function(callback){
    
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
    
    Recit_affichage:function(callback){
    
        var sql="SELECT DATE_FORMAT(dateRecit,'%d/%m/%Y') AS dateRecit, nomRecit, auteurRecit, recit FROM recit";
        db.query(sql, function (err, data, fields){
            console.log(err)
            if (err) throw err;
            return callback(data);
        });
        
    }
}
