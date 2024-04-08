@echo off

:menuPrincipal
title Utilitaire d'installation de x37 Vol3 par PACA Transports 
echo   _  _  _  _   __                    
echo  /_//_// `/_/  /__  _   __  _  __/_ _
echo /  / //_,/ /  ///_ / /_\/_//_// / _\ 
echo                        /             
echo Mod GX x37 Vol.3 FE
echo Version [Stable 1]
echo Version de l'installateur [PACATC_0.0.3]
echo.
echo Selectionnez une option et appuyez sur entree:
echo [1] Installer le pack
echo [2] Verifier les mises a jour
echo [3] A propos
echo [0] Quitter
echo.



set "dossierSource=%~dp0\HeuliezBus_X37_Vol3_FE.zip"
set /p "choix="

if "%choix%"=="1" goto menuCopie
if "%choix%"=="2" goto ouvrirSiteWeb
if "%choix%"=="3" goto aPropos
if "%choix%"=="0" goto quitter

cls
call :showError "Selection invalide! (Code 3)"
goto menuPrincipal



	
:menuCopie
cls
title Selection du repertoire
echo   _  _  _  _   __                    
echo  /_//_// `/_/  /__  _   __  _  __/_ _
echo /  / //_,/ /  ///_ / /_\/_//_// / _\ 
echo                        /             
echo Mod GX x37 Vol.3 FE - Selection du Repertoire
echo.
echo.
echo Le repertoire de la racine est l'endroit ou le jeu OMSI est installe sur votre pc.
set /p "nomDossier=Entrez le repertoire de la racine du jeu OMSI 2 (DLC x37 Vol 2 obligatoire): "
set "nomFichierAVerifier=Vehicles\HeuliezBus_X37_Vol2\Script\Cockpit_stringvarlist.txt"
set "cheminFichierAVerifier=%nomDossier%\%nomFichierAVerifier%"
set "cheminCopie=%nomDossier%\Vehicles"
set "password=PRIVE"
set "sevenZipPath=%~dp0\7z.exe"
set "fichierAVerifierVol3=%nomDossier%\Vehicles\HeuliezBus_X37_Vol3_FE\Script\Cockpit_stringvarlist.txt"


if not exist "%cheminFichierAVerifier%" (
    cls
	call :showError "DLC Introuvable! (Code 2)"
    goto menuCopie
)


set /p contenu=<"%cheminFichierAVerifier%"
if "%contenu%"=="cockpit_temperatur" (
cls
	title DLC trouve!
	echo   _  _  _  _   __                    
	echo  /_//_// `/_/  /__  _   __  _  __/_ _
	echo /  / //_,/ /  ///_ / /_\/_//_// / _\ 
	echo                        /             
	echo Mod GX x37 Vol.3 FE 
	echo.
    echo DLC x37 Vol2 trouve! 
	echo.

if exist "%fichierAVerifierVol3%" (
    echo Il semble que x37 Vol3 Ver Alpha 1 soit deja installe. La procedure ecrasera
	echo l'installation actuelle! Sauvegardez vos livrees, etc.
	echo Continuez si vous souhaitez reinstaller Vol3
	echo ou si vous souhaitez mettre a jour le pack.
	echo.
	echo Demarrer la maj de x37 Vol3 FE maintenant?
	echo Temps estime : 4min
    rem Mettez ici le texte que vous voulez afficher si le dossier existe.
) else (
    echo Demarrer l'installation de x37 Vol3 FE maintenant ? 
	echo Temps estime : 3min
    rem Mettez ici le texte que vous voulez afficher si le dossier n'existe pas.
)
	echo.
	set /p "install=Appuyez sur entree pour demarrer l'installation ou quitter pour annuler."
    cls
    title Installation en cours. N'hesitez pas a nous suivre sur instagram : paca_transports
	echo   _  _  _  _   __                    
	echo  /_//_// `/_/  /__  _   __  _  __/_ _
	echo /  / //_,/ /  ///_ / /_\/_//_// / _\ 
	echo                        /             
	echo Installation en cours... Merci de ne pas quitter l'utilitaire svp.
	echo.
    echo.
    echo Le saviez-vous? Ce pack est constamment mis a jour et proposera
    echo de tous nouveaux vehicules dans l'avenir. Suivez nous sur
    echo Instagram PACA Transports ou sur notre page YouTube OMSI 2
    echo Modding. Bon jeu sur OMSI 2 !
    echo.
    echo.
    echo.
    echo.
	"%sevenZipPath%" x "%dossierSource%" -o"%cheminCopie%" -p"%password%" -aoa
	del /Q "%nomDossier%\Vehicles\HeuliezBus_X37_Vol3_FE"
	goto installfini 
    echo.
	
    
) else (
    call :showError "Contenu invalide! (Code 1)"
)
cls
echo Copie terminee.
goto menuPrincipal

:installfini
cls
title Fin de l'installation
echo   _  _  _  _   __                    
echo  /_//_// `/_/  /__  _   __  _  __/_ _
echo /  / //_,/ /  ///_ / /_\/_//_// / _\ 
echo                        /             
echo Fin de l'installation
echo.
echo.
echo L'assistant d'installation de x37 Vol3 FE est termine. 
echo N'hesitez pas a nous repertorier les bugs presents sur notre
echo depot Github ou sur nos reseaux sociaux!
echo.
echo.
echo Cet installateur, etant en phase beta, peut presenter des bugs.
echo Signalez nous tout probleme qui pourrait arriver lors de l'installation.
pause
cls
goto menuPrincipal

:ouvrirSiteWeb
start https://github.com/pacatransports/gx337vol3fe
cls
goto menuPrincipal

:aPropos
cls
title A propos...
echo   _  _  _  _   __                    
echo  /_//_// `/_/  /__  _   __  _  __/_ _
echo /  / //_,/ /  ///_ / /_\/_//_// / _\ 
echo                        /             
echo Mod GX x37 Vol.3 FE
echo.
echo.
echo.
echo Fonctionnalites principales
echo.
echo Ameliorations visuelles : Des textures de haute qualite et des details ameliores pour offrir une experience visuelle plus realiste.
echo.
echo Nouveaux sons : Un ensemble de sons realistes pour une immersion sonore accrue.
echo.
echo Fonctionnalites ameliorees : Ajout de fonctionnalites specifiques des vehicules des reseaux de transport et ameliorations pour une experience de conduite plus realiste.
echo.
echo Version Beta 1
echo.
echo.
echo Assurez-vous qu'OMSI 2 est a jour a la version 2.3.004 et qu'il repond aux exigences minimales du DLC x37 Vol.2.
echo .
echo Toutes les infos du mod sur notre page instagram.
pause
cls
goto menuPrincipal

:quitter
exit /b

 :showError
	echo Erreur: %*
	msg * %*
	



	
	