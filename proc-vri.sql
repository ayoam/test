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



