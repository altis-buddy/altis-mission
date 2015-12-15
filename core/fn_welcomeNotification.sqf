/*
	File: fn_welcomeNotification.sqf

	Description:
	Called upon first spawn selection and welcomes our player.
*/
format["Welcome %1, Please read the following as it is important!",profileName] hintC
[
	"Bienvenue sur Tocarland !",
	"Une touche d'interaction a été introduite, elle remplace la plupart des actions utilisés par la molette.
	Par default, cette touche est [Raccourcis Windows]; vous pouvez changer cette touche en appuyant sur Echap et aller dans Configurer -> Controles -> Modifier et définir 'Utiliser action 10' par une touche comme H.
	Cette touche sera utilisé pour les actions suivantes :",
	"Ramasser des objets ou de l'argent",
	"Pêcher et récolter",
	"Interagir avec les joueurs (en tant que policier)",
	"Interagir avec les véhicules (réparer et actions policière)",
	"",
	"Si vous avez quelques soucis avec les intéractions ou pour ramasser des objets, attendez un petit peu."
];
