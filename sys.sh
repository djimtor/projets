#!/bin/bash
#================================================
# Nom :djimtor aladoum
# prenom: serge  gaston
# matricule:14b046fs
#================================================
#------------------------------------------------
# Menu - Affichage d'un menu
#------------------------------------------------
# Args : $1    = Titre du menu
#        $2n   = Fonction associée 'n' au choix
#        $2n+1 = Libellé du choix 'n' du menu
#------------------------------------------------
Menu()
{
  local -a menu fonc
  local titre nbchoix
  # Constitution du menu
  if [[ $(( $# % 1 )) -ne 0 ]] ; then
     echo "$0 - Menu invalide" >&2
     return 1
  fi
  titre="$1"
  shift 1
  set "$@" "return 0" "Sortie"
  while [[ $# -gt 0 ]]
  do
     (( nbchoix += 1 ))
     fonc[$nbchoix]="$1"
     menu[$nbchoix]="$2"
     shift 2
  done
  # Affichage menu
  PS3="Votre choix ? "
  while :
  do
     echo
     [[ -n "$titre" ]] && echo -e "$titre\n"
     select choix in "${menu[@]}"
     do
        if [[ -z "$choix" ]]
           then echo -e "\nChoix invalide"
           else eval ${fonc[$REPLY]}
        fi
        break
     done || break
  done
}
#------------------------------------------------
# information utilisateur
#------------------------------------------------
infos()
{
user=$(ls /home)
echo "$user";
}
#-----------------------------------------------# Installation de Xampp et de son environnement
#------------------------------------------------
installe()
{
echo -e "installation de xampp"
  sudo wget https://www.apachefriends.org/fr/download_success.html/xampp-linux-x64-5.6.30-1-installer.run;
              echo "Fin de votre installation ";
              echo "Debut de l'installation.... ";
             sudo chmod 777 xampp-linux-x64-5.6.30-1-installer.run;
             sudo ./xampp-linux-x64-5.6.30-1-installer.run;
              echo "Fin de l'installation xampp ";
              echo "Lancement de xampp ";
             sudo /lamp/lamp/ start;


}
#------------------------------------------------
# Archivage des elements du repertoire personnel
#------------------------------------------------
archivages()
{
    echo "Archivage en cours.... ";
 sudo find . -ctime -2> monfichier1 | tar cvf monfichier1.tar monfichier1;
}
   
#------------------------------------------------
#informations sur le disque, memoire, processeur et swap"
#------------------------------------------------
ifd()
{
echo  "================================================"
echo  "================================================"
             echo "INFORMATION SUR LE PROCESSEUR,LA MEMOIRE ET LE SWAP"
             
echo  "================================================"
echo  "================================================"
cpu=$(top -n1 -b | head -6)
echo  -e"$cpu"

  
}
#================================================
# M A I N . . .
#================================================
Menu \
  "+++  MON  Menu  +++"                           \
  infos    "information sur les utilisateurs"          \
  installe "installation de xampp et de son environnement" \
  archivages "Archivage des elements du repertoire personnel"             \
  ifd "informations sur le disque, memoire, processeur et swap"
