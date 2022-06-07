---------------------------------------INTERVENTIONS PROCEDURES----------------------------------------
--proc rechercher intervention
use db_gestionservice_vri;
DELIMITER $$
create procedure rechercherIntervention(
    Pnum_interv int,
    PNum_client int,
    PdateMin date,
    PdateMax date,
    Pid_Appareil int,
    Pid_technicien int,
    Pid_status int,
    Pid_type int,
    Pgarantie_interv bit,
    Pid_Domaine int,
    Pid_categorie int)
begin

  select * from intervention i join client c on i.Num_client=c.Num_client
  join appareil a on a.id_Appareil=i.id_Appareil
  join technicien t on t.id_technicien=i.id_technicien
  join status_intervention s on s.id_status=i.id_status
  join type_intervention ti on ti.id_type=i.id_type
  join categorie cat on a.id_categorie=cat.id_categorie
  join domaine dom on a.id_Domaine=dom.id_Domaine   
  where (intervention.num_interv=Pnum_interv or Pnum_interv is null)
  and (intervention.Num_client=PNum_client or PNum_client is null)
  and (intervention.date_interv>=PdateMin or Pdate_interv is null)
  and (intervention.date_interv<=PdateMax or Pdate_interv is null)
  and (intervention.id_Appareil=Pid_Appareil or Pid_Appareil is null)
  and (intervention.id_technicien=Pid_technicien or Pid_technicien is null)
  and (intervention.id_status=Pid_status or Pid_status is null)
  and (intervention.id_type=Pid_type or Pid_type is null)
  and (intervention.garantie_interv=Pgarantie_interv or Pgarantie_interv is null)
  and (categorie.id_categorie=Pid_categorie or Pid_categorie is null)
  and (domaine.id_Domaine=Pid_Domaine or Pid_Domaine is null);

end $$
DELIMITER;


--proc ajouter intervention
use db_gestionservice_vri;
DELIMITER $$
create procedure ajouterIntervention(
    `Pdate_interv` date,
    `Pinstallation_conforme` bit,
    `Padr_interv` varchar(250),
    `PNum_client` int,
    `Pid_Appareil` int,
    `Pid_technicien` int,
    `Pid_status` int,
    `Pid_type` int,
    `Pgarantie_interv` bit
  )
begin
  insert into intervention values (
    null,
    `Pdate_interv`,
    `Pinstallation_conforme`,
    `Padr_interv`,
    `PNum_client`,
    `Pid_Appareil`,
    `Pid_technicien`,
    `Pid_status`,
    `Pid_type`,
    `Pgarantie_interv`
  );

end $$
DELIMITER ;

--proc modifier intervention
use db_gestionservice_vri;
DELIMITER $$
create procedure modifierIntervention(
    `Pnum_interv` int,
    `Pdate_interv` date,
    `Pinstallation_conforme` bit,
    `Padr_interv` varchar(250),
    `PNum_client` int,
    `Pid_Appareil` int,
    `Pid_technicien` int,
    `Pid_status` int,
    `Pid_type` int,
    `Pgarantie_interv` bit
  )
begin
  update intervention set
    date_interv=Pdate_interv,
    installation_conforme=Pinstallation_conforme,
    adr_interv=Padr_interv,
    Num_client=PNum_client,
    id_Appareil=Pid_Appareil,
    id_technicien=Pid_technicien,
    id_status=Pid_status,
    id_type=Pid_type,
    garantie_interv=Pgarantie_interv 
    where num_interv=Pnum_interv;

end $$
DELIMITER ;



--proc supprimer intervention
use db_gestionservice_vri;
DELIMITER $$
create procedure supprimerIntervention(
      `Pnum_interv` int
    )
begin
  delete from intervention where num_interv=Pnum_interv;
end $$
DELIMITER ;


---------------------------------------TECHNICIEN PROCEDURES----------------------------------------
--proc rechercher intervention
use db_gestionservice_vri;
DELIMITER $$
create procedure rechercherTechnicien(
    `Pid_technicien` int,
    `PNom_technicien` varchar(30),
    `Pcin_technicien` varchar(30),
    `Pid_domaine` int
  )
begin

  select * from technicien t join domaine d on t.id_domaine=d.id_Domaine
  where (technicien.id_technicien=Pid_technicien or Pid_technicien is null)
  and (technicien.Nom_technicien=PNom_technicien or PNom_technicien is null)
  and (technicien.cin_technicien=Pcin_technicien or Pcin_technicien is null)
  and (domaine.id_domaine=Pid_domaine or Pid_domaine is null);

end $$
DELIMITER ;


--proc ajouter intervention
use db_gestionservice_vri;
DELIMITER $$
create procedure ajouterTechnicien(
    `PNom_technicien` varchar(30),
    `PdateNaiss_technicien` date,
    `Padr_technicien` varchar(100),
    `Pcin_technicien` varchar(30),
    `Ptele1_technicien` varchar(30),
    `Ptele2_technicien` varchar(30),
    `Pemail_technicien` varchar(100),
    `Plogin_technicien` varchar(30),
    `Ppassword_technicien` varchar(30),
    `Pid_domaine` int
)
begin
  insert into technicien values(
    null,
    `PNom_technicien`,
    `PdateNaiss_technicien`,
    `Padr_technicien`,
    `Pcin_technicien`,
    `Ptele1_technicien`,
    `Ptele2_technicien`,
    `Pemail_technicien`,
    `Plogin_technicien`,
    `Ppassword_technicien`,
    `Pid_domaine`
  );
end $$
DELIMITER ;


--proc modifier intervention
use db_gestionservice_vri;
DELIMITER $$
create procedure modifierTechnicien(
    `Pid_technicien` int,
    `PNom_technicien` varchar(30),
    `PdateNaiss_technicien` date,
    `Padr_technicien` varchar(100),
    `Pcin_technicien` varchar(30),
    `Ptele1_technicien` varchar(30),
    `Ptele2_technicien` varchar(30),
    `Pemail_technicien` varchar(100),
    `Plogin_technicien` varchar(30),
    `Ppassword_technicien` varchar(30),
    `Pid_domaine` int
)
begin
  update technicien set
    Nom_technicien=PNom_technicien,
    dateNaiss_technicien=PdateNaiss_technicien,
    adr_technicien=Padr_technicien,
    cin_technicien=Pcin_technicien,
    tele1_technicien=Ptele1_technicien,
    tele2_technicien=Ptele2_technicien,
    email_technicien=Pemail_technicien,
    login_technicien=Plogin_technicien,
    password_technicien=Ppassword_technicien,
    id_domaine=Pid_domaine
    where id_technicien=Pid_technicien;
  
end $$
DELIMITER ;

--proc supprimer intervention
use db_gestionservice_vri;
DELIMITER $$
create procedure supprimerTechnicien(`Pid_technicien` int)
begin
  delete from technicien where id_technicien=Pid_technicien;
end $$
DELIMITER ;



---------------------------------------VISITE PROCEDURES----------------------------------------
--proc rechercher visite
use db_gestionservice_vri;
DELIMITER $$
create procedure rechercherVisite(
    `Pid_visite` int,
    `PdateMin` date,
    `PdateMax` date,
    `Pnum_interv` int
  )
begin

  select * from visite v join technicien t on v.id_visite=t.id_visite
  join intervention i on i.num_interv=t.num_interv
  where (visite.id_visite=Pid_visite or Pid_visite is null)
  and (visite.date_visite>=PdateMin or PdateMin is null)
  and (visite.date_visite<=PdateMax or PdateMax is null)
  and (visite.num_interv or Pnum_interv is null);

end $$
DELIMITER ;


--proc ajouter visite
use db_gestionservice_vri;
DELIMITER $$
create procedure ajouterVisite(
    `Pdate_visite` date,
    `Pobservation_visite` varchar(250),
    `Pnum_interv` int
  )
begin

  insert into visite values (
    null,
    `Pdate_visite`,
    `Pobservation_visite`,
    `Pnum_interv`
  );

end $$
DELIMITER ;


--proc modifier visite
use db_gestionservice_vri;
DELIMITER $$
create procedure modifierVisite(
    `Pid_visite` int,
    `Pdate_visite` date,
    `Pobservation_visite` varchar(250),
    `Pnum_interv` int
  )
begin

  update visite set
    id_visite=Pid_visite, 
    date_visite=Pdate_visite,
    observation_visite=Pobservation_visite,
    num_interv=Pnum_interv
    where id_visite=Pid_visite;

end $$
DELIMITER ;

--proc supprimer visite
use db_gestionservice_vri;
DELIMITER $$
create procedure supprimerVisite(`Pid_visite` int)
begin
  delete from visite where id_visite=Pid_visite;
end $$
DELIMITER ;


---------------------------------------PANNE PROCEDURES----------------------------------------
--proc rechercher panne
use db_gestionservice_vri;
DELIMITER $$
create procedure rechercherPanne(
    `Pid_panne` int,
    `Pid_categorie` int
  )
begin

  select * from panne p join categorie c on p.id_categorie=c.id_categorie
  where (panne.id_panne=Pid_panne or Pid_panne is null)
  and (panne.id_categorie=Pid_categorie or Pid_categorie is null);

end $$
DELIMITER ;


--proc ajouter panne
use db_gestionservice_vri;
DELIMITER $$
create procedure ajouterPanne(
    null,
    `Pnom_panne` varchar(30),
    `Pid_categorie` int
  )
begin

  insert into panne values (
    null,
    `Pnom_panne`,
    `Pid_categorie`
  );

end $$
DELIMITER ;



--proc modifier panne
use db_gestionservice_vri;
DELIMITER $$
create procedure modifierPanne(
    `Pid_panne` int,
    `Pnom_panne` varchar(30),
    `Pid_categorie` int
  )
begin

  update panne set 
    nom_panne=Pnom_panne,
    id_categorie=Pid_categorie
    where id_panne=Pid_panne;

end $$
DELIMITER ;


--proc supprimer panne
use db_gestionservice_vri;
DELIMITER $$
create procedure supprimerPanne(
    `Pid_panne` int
  )
begin

  delete from panne where id_panne=Pid_panne;

end $$
DELIMITER ;



---------------------------------------MARQUE PROCEDURES----------------------------------------
--proc rechercher marque
use db_gestionservice_vri;
DELIMITER $$
create procedure rechercherMarque(
    `Pid_marque` int,
    `Pnom_marque` varchar(30)
  )
begin

  select * from marque
  where (marque.id_marque=Pid_marque or Pid_marque is null)
  and (marque.nom_marque=Pnom_marque or Pnom_marque is null);

end $$
DELIMITER ;


--proc ajouter marque
use db_gestionservice_vri;
DELIMITER $$
create procedure ajouterMarque(
    null,
    `Pnom_marque` varchar(30)
  )
begin

  insert into marque values(
     `Pid_marque`,
      `Pnom_marque`
  );

end $$
DELIMITER ;


--proc modifier marque
use db_gestionservice_vri;
DELIMITER $$
create procedure modifierMarque(
    `Pid_marque` int,
    `Pnom_marque` varchar(30)
  )
begin

  update marque set
    nom_marque=Pnom_marque
    where id_marque=Pid_marque;

end $$
DELIMITER ;

--proc supprimer marque
use db_gestionservice_vri;
DELIMITER $$
create procedure supprimerMarque(
    `Pid_marque` int
  )
begin

  delete from marque where id_marque=Pid_marque;

end $$
DELIMITER ;

---------------------------------------PIECES PROCEDURES----------------------------------------
--proc rechercher piece
use db_gestionservice_vri;
DELIMITER $$
create procedure rechercherPiece(
    `Pid_piece` int,
    `Pref_piece` varchar(100),
    `Pnom_piece` varchar(100),
    `Pid_Appareil` int
  )
begin

  select * from piece p join appareil ap on p.id_Appareil=ap.id_Appareil
  join fournisseur f on f.num_Fournisseur=p.num_Fournisseur
  where (id_piece=Pid_piece or Pid_piece is null)
  and (ref_piece=Pref_piece or Pref_piece is null)
  and (Pnom_piece=nom_piece or nom_piece is null)
  and (Pid_Appareil=id_Appareil or id_Appareil is null);

end $$
DELIMITER ;

--proc ajouter piece
use db_gestionservice_vri;
DELIMITER $$
create procedure ajouterPiece(
    null,
    `Pref_piece` varchar(100),
    `Pnom_piece` varchar(100),
    `Pstock_pice` int,
    `PprixAchat_piece` decimal(10,0),
    `PprixVente_piece` decimal(10,0),
    `Pid_Appareil` int,
    `Pnum_Fournisseur` int
  )
begin

  insert into piece values(
    `Pid_piece`,
    `Pref_piece`,
    `Pnom_piece`,
    `Pstock_pice`,
    `PprixAchat_piece`,
    `PprixVente_piece`,
    `Pid_Appareil`,
    `Pnum_Fournisseur`
  );

end $$
DELIMITER ;


--proc modifier piece
use db_gestionservice_vri;
DELIMITER $$
create procedure modifierPiece(
    `Pid_piece` int,
    `Pref_piece` varchar(100),
    `Pnom_piece` varchar(100),
    `Pstock_pice` int,
    `PprixAchat_piece` decimal(10,0),
    `PprixVente_piece` decimal(10,0),
    `Pid_Appareil` int,
    `Pnum_Fournisseur` int
  )
begin

  update piece set
    ref_piece=Pref_piece,
    nom_piece=Pnom_piece,
    stock_pice=Pstock_pice,
    prixAchat_piece=PprixAchat_piece,
    prixVente_piece=PprixVente_piece,
    id_Appareil=Pid_Appareil,
    num_Fournisseur=Pnum_Fournisseur
    where  id_piece=Pid_piece;
 
end $$
DELIMITER ;


--proc supprimer piece
use db_gestionservice_vri;
DELIMITER $$
create procedure supprimerPiece(
    `Pid_piece` int
  )
begin

  delete from piece where id_piece=Pid_piece;
 
end $$
DELIMITER ;


---------------------------------------PIECE JOINTES PROCEDURES----------------------------------------
--proc ajouter piece jointe
use db_gestionservice_vri;
DELIMITER $$
create procedure ajouterPieceJointe(
    null,
    `Plien_pj` varbinary(60000),
    `Pnum_interv` int
  )
begin

  insert into piece_jointe values(
    `Pid_pj`,
    `Plien_pj`,
    `Pnum_interv`
  );

end $$
DELIMITER ;

--proc supprimer piece jointe
use db_gestionservice_vri;
DELIMITER $$
create procedure supprimerPieceJointe(
    `Pid_pj` int
  )
begin

  delete from piece_jointe where id_pj=Pid_pj;

end $$
DELIMITER ;



USE bdintervention

/*Procedure suprimer Appareil*/
DELIMITER ;;
CREATE  PROCEDURE `supprimerappareil`(`Pid_appareil` int)
begin
  delete from appareil where id_appareil=Pid_appareil;
end ;;
DELIMITER ;
/*Procedure suprimer Bon Livraison*/
DELIMITER ;;
CREATE  PROCEDURE `supprimerbon`(`Pid_bon` int)
begin
  delete from bon_livraison where id_bon=Pid_bon;
end ;;
DELIMITER ;
/*Procedure suprimer categorie*/
DELIMITER ;;
CREATE  PROCEDURE `supprimerctaegorie`(`Pid_cat` int)
begin
  delete from categorie where id_categorie=Pid_cat;
end ;;
DELIMITER ;







/*Procedure suprimer domaine*/
DELIMITER ;;
CREATE  PROCEDURE `supprimerclient`(`Pid_domaine` int)
begin
  delete from domaine where id_domaine=Pid_domaine;
end ;;
DELIMITER ;


/*Procedure suprimer Facture*/

DELIMITER ;;
CREATE  PROCEDURE `supprimerfacture`(`Pnum_facture` int)
begin
  delete from facture where num_facture=Pnum_factue;
end ;;
DELIMITER ;

/*Procedure suprimer fournisseur*/

DELIMITER ;;
CREATE  PROCEDURE `supprimerfournisseur`(`Pnum_fournisseur` int)
begin
  delete from fornisseur where num_Fornisseur=Pnum_fournisseur;
end ;;
DELIMITER ;

/*----------------------------------------------------------------------------*/
/*-------------------------PROCEDURE DE L'AJOUTE------------------------------*/
/*----------------------------------------------------------------------------*/
/*  procedure  Ajouter  client*/
DELIMITER $$
create procedure ajouterClient(
     `Pnom_client` int,
     `Pcin_client`varchar(50),
     `Padr_client` varchar(250),
     `Ptele1` varchar(50),
     `Ptele2` varchar(50),
     `email` nvarchar(50),
     `type_client` varchar(50)
  )
begin

  insert into client(Num_client,Nom_client,cin_client,adresse_client,tele1_client,tele2_client,email_client,type_client)
  values (
    `Pnom_client`, 
    `Pcin_client`,
    `Padr_client`,
    `Ptele1`,
    `Ptele2`,
     `email`,
      `type_client`
  );

end $$
DELIMITER ;


/*  procedure  Ajouter  Appareil*/
DELIMITER $$
create procedure ajouterAppareil(
     `Pid_apr` int,
     `Pref_apr`varchar(50),
     `Pnom_apr` varchar(250),
     `Pid_domaine` int,
     `Pid_marque` int
  )
begin

  insert into appareil(reference_Appareil,nom_Appareil,id_Domaine,id_marque)
  values (
     `Pid_apr`, 
    `Pref_apr`,
   `Pnom_apr`,
    `Pid_domaine`,
    `Pid_marque`

  );

end $$
DELIMITER ;

/*  procedure  Ajouter bon */
DELIMITER $$
create procedure ajouterBon(
     
     `Pdate` date,
     `Pnum_facture` int
  )
begin

  insert into bon_livraison(date_bon,num_facture)
  values (
    `Pdate`, 
   `Pnum_facture`
  );

end $$
DELIMITER ;

/*  procedure  Ajouter Facture */
DELIMITER $$
create procedure ajouterFacture(
     `Pnum_interv` int
  )
begin

  insert into facture(num_interv)
  values (
   `Pnum_interv`
  );
end $$
DELIMITER ;


/*  procedure  Ajouter Domiane */
DELIMITER $$
create procedure ajouterDomaine(
     `Pnom_domaine` varchar(50)
  )
begin

  insert into domaine(nom_domaine)
  values (
   `Pnom_domaine`
  );
end $$
DELIMITER ;


/*  procedure  Ajouter Fornisseur */
DELIMITER $$
create procedure ajouterFornisseur(
     `Pnom_Fornisseur` varchar(50),
     `Ptele1_Fornisseur` varchar(50),
     `Ptele2_Fornisseur` varchar(50),
     `Padr_Fornisseur` varchar(50),
     `Pemail_Fornisseur` varchar(50)
  )
begin

  insert into fornisseur(nom_Fornisseur,tele1_Fornisseur,tele2_Fornisseur,adr_Fornisseur,email_Fornisseur)
  values (
   `Pnom_Fornisseur`,`Ptele1_Fornisseur`,`Ptele2_Fornisseur`,`Padr_Fornisseur`,`Pemail_Fornisseur`
  );
end $$
DELIMITER ;


/*  procedure  Ajouter Categorie */
DELIMITER $$
create procedure ajouterCategorie(
     `Pnom_cat` varchar(50),
     `Pid_domaine` int

  )
begin

  insert into categorie(nom_categorie,id_domaine)
  values (
  `Pnom_cat`,`Pid_domaine`
  );
end $$
DELIMITER ;


/*  procedure  Ajouter pieceIntervention */
DELIMITER $$
create procedure ajouterPieceIntervention(
     `Pid_piece` int,
     `Pnum_interv` int,
	`Pqte` int
  )
begin

  insert into detail_piece_intervention(id_piece,num_interv,qte)
  values (
  `Pid_piece`, `Pnum_interv`,`Pqte`
  );
end $$
DELIMITER ;


/*  procedure  Ajouter panneIntervention */
DELIMITER $$
create procedure ajouterPanneIntervention(
     `Pid_panne` int,
     `Pnum_interv` int,
	`Pdescre` varchar(250),
    `Pcout` decimal
  )
begin

  insert into detail_panne_intervention(id_panne,num_interv,descreption,cou_reparation)
  values (
  `Pid_panne`, `Pnum_interv`,`Pdescre`,`Pcout`
  );
end $$
DELIMITER ;


/*----------------------------------------------------------------------------*/
/*-------------------------PROCEDURE DE la Modification------------------------------*/
/*----------------------------------------------------------------------------*/
/*  procedure  Modifier  client*/
DELIMITER $$
create procedure updateClient(
     `Pnum_clent` int,
     `Pnom_client` int,
     `Pcin_client`varchar(50),
     `Padr_client` varchar(250),
     `Ptele1` varchar(50),
     `Ptele2` varchar(50),
     `email` nvarchar(50),
     `Ptype_client` varchar(50)
  )
begin

  update client set 
    Nom_client=Pnom_cient,
    cin_client=Pcin_client,
    adresse_client=Padr_client,
    tele1_client=Ptele1,
    tele2_client  =Ptele2,
    email_client=email,
    type_client=Ptype_client
    where Num_client=Pnum_clent;

end $$
DELIMITER ;


/*  procedure  Ajouter  Update appareil*/
DELIMITER $$
create procedure updateAppareil(
     `Pid_apr` int,
     `Pref_apr`varchar(50),
     `Pnom_apr` varchar(250),
     `Pid_domaine` int,
     `Pid_marque` int
  )
begin

  update appareil set 
    reference_Appareil=Pid_apr,
    nom__Apparei=Pnom_apr,
    id_Appareil=Pid_domaine,
    id_dmaine=Pid_domaine,
    id_marque  =Pid_marque
    where id_Appareil=Pid_apr;
end $$
DELIMITER ;

/*  procedure  update  bon */
DELIMITER $$
create procedure updateBon(
     `Pid_bon` int,
     `Pdate` date,
     `Pnum_facture` int
  )
begin

    update bon_livraison set 
    dtae_bon=Pdate,
    num_facture=Pnum_facture
    where id_bon=Pid_bon;

end $$
DELIMITER ;

/*  procedure  update Facture */
DELIMITER $$
create procedure updateFacture(
	`Pnum_facture` int,
	`Pnum_interv` int
  )
begin

 update facture set 
    num_interv=Pnum_interv
    where num_facture=Pnum_facture;
end $$
DELIMITER ;


/*  procedure  update fornisseur */
DELIMITER $$
create procedure updateFornisseur(
	`Pnum_Fornisseur` int,
     `Pnom_Fornisseur` varchar(50),
     `Ptele1_Fornisseur` varchar(50),
     `Ptele2_Fornisseur` varchar(50),
     `Padr_Fornisseur` varchar(50),
     `Pemail_Fornisseur` varchar(50)
  )
begin

  update fornisseur set 
    dtae_bon=Pdate,
    nom_Fornisseur=Pnom_Fornisseur,
    tele1_Fornisseur=Ptele1_Fornisseur,
    tele2_Fornisseur=Ptele2_Fornisseur,
    adr_Fornisseur=Padr_Fornisseur,
    email_Fournisseur=Pemail_Fournisseur
    where num_Fornisseur=Pnum_Fornisseur;
end $$
DELIMITER ;


/*  procedure  UPDATE categorie */
DELIMITER $$
create procedure updateCategorie(
	`Pid_categorie` int,
    `Pnom_cat` varchar(50),
     `Pid_domaine` int
  )
begin

  update categorie set 
    nom_categorie=Pnom_categorie,
    id_domaine=Pid_domaine
    where id_categorie=Pid_categorie;
end $$
DELIMITER ;





/*  procedure  update pieceIntervention */
DELIMITER $$
create procedure updatePieceIntervention(
     `Pid_piece` int,
     `Pnum_interv` int,
	`Pqte` int
  )
begin

  update detail_piece_intervention set 
    num_interv=Pnum_interv,
    qte=Pqte
    where id_piece=Pid_piece;
end $$
DELIMITER ;


/*  procedure  update panneIntervention */
DELIMITER $$
create procedure updatePanneIntervention(
     `Pid_panne` int,
     `Pnum_interv` int,
	`Pdescre` varchar(250),
    `Pcout` decimal
  )
begin

  update detail_panne_intervention set 
    num_interv=Pnum_interv,
    description=Pdescre,
    cout_reparation=Pcout
    where id_panne=Pid_panne;
end $$
DELIMITER ;

/*  procedure  update Domiane */
DELIMITER $$
create procedure updateDomaine(
	`Pid_domaine` int,
     `Pnom_domaine` varchar(50)
  )
begin

  update domaine set 
    nom_domaine=Pnom_domaine
    where id_domaine=Pid_domaine;
end $$
DELIMITER ;
/*----------------------------------------------------------------------------*/
/*-------------------------PROCEDURE DE la recherch------------------------------*/
/*----------------------------------------------------------------------------*/

/*--------rechercher client*/
DELIMITER $$
create procedure rechercherClient(
`Pnum_clent` int,
     `Pnom_client` int,
     `Pcin_client`varchar(50),
     `Padr_client` varchar(250),
     `Ptele1` varchar(50),
     `Ptele2` varchar(50),
     `email` nvarchar(50),
     `Ptype_client` varchar(50)
  )
begin
  
  select * from client c join  intervention i on i.Num_client=c.Num_client
  where (client.Num_client=num_clent or Pnum_clent is null)
  and (client.Nom_client=nom_client or Pnom_client is null)
  and (client.cin_client=PdateMax or Pcin_client is null)
  and (client.adresse_client =Padr_client or Padr_client is null)
  and (client.tele1_client=Ptele1 or Ptele1 is null)
  and (client.tele2_client=Ptele2 or Ptele2 is null)
  and (client.type_client=Ptype_client or Ptype_client is null);

end $$
DELIMITER ;


/*--------rechercher appareil*/
DELIMITER $$
create procedure rechercherAppareil(
     `Pid_apr` int,
     `Pref_apr`varchar(50),
     `Pnom_apr` varchar(250),
     `Pid_domaine` int,
     `Pid_marque` int
  )
begin
  
  select * from appareil 
  where (appareil.id_Appareil=Pid_apr or Pid_apr is null)
  and (appareil.reference_Appareil=Pref_apr or Pref_apr is null)
  and (appareil.nom_Appareil=Pnom_apr or Pnom_apr is null)
  and (appareil.id_domaine =Pid_domaine or Pid_domaine is null)
  and (appareil.id_marque=Pid_marque or Pid_marque is null);

end $$
DELIMITER ;

/*--------rechercher bon*/
DELIMITER $$
create procedure rechercherBon(
	`Pid_bon` int,
     `Pdate` date,
     `Pnum_facture` int 
     )
begin
  
  select * from bon_livraison 
  where (bon_livraison.id_bon=Pid_bon or Pid_bon is null)
  and (bon_livraison.Pdate=Pref_apr or Pdate is null)
  and (bon_livraison.num_facture=Pnum_facture or Pnum_facture is null);
  
end $$
DELIMITER ;
/*--------rechercher domaine */
DELIMITER $$
create procedure rechercherBon(
		`Pid_domaine` int,
     `Pnom_domaine` varchar(50)
     )
begin
  
  select * from domaine 
  where (domaine.id_bon=Pid_bon or Pid_bon is null)
  and (domaien.nom_domaine=Pnom_domaine or Pnom_domaine is null);
  
end $$
DELIMITER ;

/*--------rechercher facture */
DELIMITER $$
create procedure rechercherBon(
		`Pnum_facture` int,
     `Pnum_interv` int
     )
begin
  select * from facture 
  where (facture.num_facture=Pnum_facture or Pnum_facture is null)
  and (facture.num_interv=Pnum_interv or Pnum_interv is null);
  
end $$
DELIMITER ;

/*--------rechercher Foniseur */
DELIMITER $$
create procedure rechercherBon(
	`Pnum_Fornisseur` int,
     `Pnom_Fornisseur` varchar(50),
     `Ptele1_Fornisseur` varchar(50),
     `Ptele2_Fornisseur` varchar(50),
     `Padr_Fornisseur` varchar(50),
     `Pemail_Fornisseur` varchar(50)
     )
begin
  select * from fournisseur
  
  
  where (fournisseur.num_Fornisseur=Pnum_Fornisseur or Pnum_Fornisseur is null)
  and (fournisseur.nom_Fornisseur=Pnom_Fornisseur or Pnom_Fornisseur is null)
  and (fournisseur.tele1_Fornisseur=Ptele1_Fornisseur or Ptele1_Fornisseur is null)
  and (fournisseur.tele2_Fornisseur=Ptele2_Fornisseur or Ptele2_Fornisseur is null)
  and (fournisseur.adr_Fornisseur=Padr_Fornisseur or Padr_Fornisseur is null)
  and (fournisseur.email_Fornisseur=Pemail_Fornisseur or Pemail_Fornisseur is null);

end $$
DELIMITER ;