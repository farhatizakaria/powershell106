Clear-Host
#=============================Définition des Variables================================================

$ve = 18
$vch = 'x'
$ve.GetType()
$vch.GetType()
$ve = $ve + 5
echo $ve
Write-Host $ve
Write-Host $vch


#====================================définition des constant==========================================
New-Variable -Name PI -value 3.14 -Option Constant
$pi = 4
$pi.GetType()
$vch.GetType()
[int]$v1= Read-Host 'entrer un nombre entier'
Write-Host $v1


#=========================================================Opérateurs====================================
#aréthmétique +,-,*,/,%
#comparaison -eq -ne -gt -ge -lt -le
#opérateur -in -not in
#opérateur logiques -and -or -not ! -xor



#======================================les Boucles==========================================================
$nombre = 0
$tab = 0..99
$tab.Length
while ($nombre -lt $tab.Length)
{
 $tab[$nombre]
 $nombre++   
}

#======================================================la Boucle for=======================================
$tab = 0..99
for ($i = 0; $i -le 99; $i++)
{ 
 Write-Host $tab[$i]
    
}


#=========================================la Boucle foreach===============================================

#créer plusieurs comptes utilisateurs locaux et les ajouter au groupe utilisateurs=============================

$nom_ut = "U_ID1A"
$tab_ut = 1..4
$password = Read-Host "Donner le Mot de Passe" -AsSecureString
foreach ($i in $tab_ut)
{
New-LocalUser -Name $nom_ut$i -Password $password -Description "compte stagiaire $nom_ut$i "
Add-LocalGroupMember utilisateurs -Member $nom_ut$i
   
}

#==============================Compter le nombre d'utilisateurs=============================================

$n_ut = Get-LocalUser 
Write-Host "le Nombre d'utilisateurs = " -NoNewline
$n_ut.Count
(Get-LocalUser).count


#===========================compter le nombre de comptes activés et désactivés=============================

$vcomptes = Get-LocalUser  | Where-Object {$_.enabled -eq $true}
$vcomptes = Get-LocalUser  | Where-Object enabled -EQ $true      #nouvelle notation
Write-Host 'Nombre utilisateurs Activés = ' -NoNewline
$vcomptes.Count
$vcomptes|Format-Table -AutoSize
$vcomptes = Get-LocalUser  | Where-Object {$_.enabled -eq $false}
Write-Host 'Nombre utilisateurs Désactivés = ' -NoNewline
$vcomptes.Count
echo $vcomptes|Format-Table -AutoSize


#===========================rechercher un compte par son nom s'il n'existe pas créer le==========================

$nom_rech = Read-Host 'donner un nom de compte '
$comptes = Get-LocalUser
$trouve =$false
foreach ($ut in $comptes)
{
    if ($ut.Name -eq $nom_rech)
    {
        Write-Warning " utilisateur existe déja "
        $trouve = $true
    }
}
if (!$trouve)
{
New-LocalUser -Name $nom_rech -NoPassword 
}


# ===================================une autre méthode==============================================

$nom_rech = Read-Host 'donner un nom de compte '
$vcomptes = Get-LocalUser  | Where-Object {$_.name -eq $nom_rech}
if ($vcomptes.count -eq 0 )
{
  New-LocalUser -Name $nom_rech -NoPassword 
    
}
else
{
 Write-Warning " utilisateur existe déja "   
}

