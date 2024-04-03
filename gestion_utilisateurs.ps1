#Administration des comptes utilisateurs et groupes locaux en PowerShell

#=============================les commandes du Modules Localaccounts========================

Clear-Host
#Get-Command -Module Microsoft.PowerShell.LocalAccounts

#================================mise à jour de l'aide du module localaccounts===============

#Update-Help -Module Microsoft.PowerShell.LocalAccounts

#help Get-LocalUser
#-Help Get-LocalUser -examples
#-Help Get-LocalUser -Online


#==================================Afficher les comptes utilisateurs locaux======================

#Get-LocalUser
#Get-LocalUser -Name admin
#Get-LocalUser -Name admin | Select-Object *
#Get-LocalUser -Name admin | Select-Object name,sid,objectclass |Format-Table
#Get-LocalUser -Name admin | Select-Object name,sid,objectclass |Format-List



#=====================================créer un nouveau compte utilisateur==================================

#$password = Read-Host 'Donner le Mot de Passe ' -AsSecureString
#New-LocalUser -Name utilisateur01 -Password $password -FullName "Stagiaire utilisateur01 " -Description "Stagiaire ID1A"


#====================================Afficher tous les groupes locaux=============================================

#Get-LocalGroup|Format-Table -AutoSize
 
#===========================Ajouter utilisateur01 au groupe Utilisateurs=====utiliser "," pour ajouter plusieurs===========

#Add-LocalGroupMember -Name utilisateurs -Member utilisateur01
#Get-LocalGroupMember -Name utilisateurs

#=======================créer un nouveau compte utilisateur local sans Mot de Passe (doit changer MPasse prochaine session)======

#New-LocalUser -name utilisateur02 -NoPassword -FullName "Stagiaire Utilisateur02 " -Description "compte utilisateur ID1A"
#Get-LocalUser -Name utilisateur02 | Select-Object *

#============================================Ajouter utilisateur02 au groupe Utilisateurs=============

#Add-LocalGroupMember -Name utilisateurs -Member utilisateur02 -Verbose
#Get-LocalGroupMember -Name utilisateurs

#===============================================Modifier les options de mot de passe===================

#Get-LocalUser utilisateur01 | select *
#Set-LocalUser -Name utilisateur01 -PasswordNeverExpires $true
#Get-LocalUser utilisateur01 | select *

#=================================Activer / Désactiver compte utilisateur====================================


#Disable-LocalUser -Name utilisateur01
#Get-LocalUser utilisateur01
#Enable-LocalUser -Name utilisateur01
#Get-LocalUser utilisateur01

#==================================================Supprimer un utilisateur =======================

#Remove-LocalUser -Name utilisateur02 

#Get-LocalUser
#Get-LocalGroupMember -Name utilisateurs |Format-Table

#======================================Afficher les groupes locaux=========================================

#Get-LocalGroup

#============================créer un nouveau groupe local================================================

#New-LocalGroup -Name G_ID1A -Description "Groupe local stagiaires ID1A"
#Get-LocalGroup

#====================Ajouter utilisateur01 en tant que membre du groupe G_ID1A==================================

#Add-LocalGroupMember G_ID1A -Member utilisateur01

#=============================Afficher les membres d'un groupe local============================================

#Get-LocalGroupMember G_id1a| Select-Object name,objectclass

#=============================Retirer un membre du groupe========================================================

#Remove-LocalGroupMember -Group G_id1a -Member utilisateur01
#Get-LocalGroupMember -Group G_id1a

#=======================================Supprimer un groupe local======================================================

#Remove-LocalGroup -Name G_ID1A 

#Get-LocalGroup

