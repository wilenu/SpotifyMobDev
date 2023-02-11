# SpotifyMobDev

La siguiente aplicación te permite ver un listado de albums, artistas y géneros mediante el consumo de la API de Spotify.

El patrón de arquitectura seleccionado para el desarrollo de la aplicación que se utilizo fue MVVM, aplicando buenas practivas y Clean Architecture.

Se ultilizaron gestores de dependencia como **CocoaPods** y **Swift Package Manager** para el uso de **Alamofire** y **KingFisher** los cuales son
son necesarios para el para correcto funcionamiento del proyecto.

## Ciclo de vida de la App:

### - Splahs Screen
Esta es la pantalla inicial donde se muestra el LaunchScreen inicial de la app con el logo de la misma.

### - AuthApitoken Screen
En esta pantalla se realiza el Login con la cuenta de desarrollador de Spotify donde mediande metodos obtenemos el **ApiToken**, el cual sera necesario
para poder realizar los llamados a los endpoint y poder asi traer la data necesaria.

### - TabBar 
TabBar con 2 Tabs que representan el **HomeView Screen** con un listados de los albunes en tendencia y el **Categories Screen** con un listado de Géneros.

### - HomeView Screen

En esta pantalla podras observar los Albums con cierta descripción como el nombre del album, nombre del artista, fecha de lanzamiento y la portada  
esta data cual fue solicitada mediante la **API**.

### - Categories Screen
La pantalla de Generos muestra un listado de los generos musicales solicitados en la **API**.

### - Artist Screen
En esta pantalla podras obserbar la descripcion y detalles del artista del Album seleccionado en el **HomeView Screen**, el cual te brinda la información
del nombre del artista, seguidores, y géneros musicales.

### Mejoras a realizar
1 - Mejorar el aspecto visual en General.
2 - 
3 - 
4 - Aplicar testing a todos lo modelos de la app.

Para el correcto uso de la app es necesario que siga las instrucciones de la Web de Spotify y cree una cuenta para desarrolladores. 
Ya que es necesario que tengamos acceso a un **Client ID** para poder acceder a la URL y con ello obtener el ApiToken. 
Info: https://developer.spotify.com/




