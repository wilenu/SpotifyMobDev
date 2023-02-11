# SpotifyMobDev

La siguiente aplicación te permite ver un listado de albums, artistas y géneros mediante el consumo de la API de Spotify.

El patrón de arquitectura seleccionado para el desarrollo de la aplicación que se utilizo fue MVVM, aplicando buenas practicas y Clean Architecture.

Se ultilizaron gestores de dependencia como **CocoaPods** y **Swift Package Manager** para el uso de **Alamofire** y **KingFisher** los cuales son
son necesarios para el para correcto funcionamiento del proyecto.

## Ciclo de vida de la App:

### - Splahs Screen
Esta es la pantalla inicial donde se muestra el LaunchScreen inicial de la app con el logo de la misma.

<img width="468" alt="Captura de pantalla 2023-02-10 a la(s) 20 44 02" src="https://user-images.githubusercontent.com/51270295/218225520-4f68d4c1-85ee-4db8-92da-ad9f9bc94702.png">

### - AuthApitoken Screen
En esta pantalla se realiza el Login con la cuenta de desarrollador de Spotify donde mediande un **WebView** obtenemos el **ApiToken**, el cual sera necesario para poder realizar los llamados a los endpoint y poder asi traer la data necesaria.

<img width="465" alt="Captura de pantalla 2023-02-10 a la(s) 21 28 52" src="https://user-images.githubusercontent.com/51270295/218226290-661c32a3-d201-447c-8f76-1c025f90310f.png"> <img width="468" alt="Captura de pantalla 2023-02-10 a la(s) 20 44 25" src="https://user-images.githubusercontent.com/51270295/218225547-f3f132f1-cec6-4eeb-92d3-95bcbacd8541.png"> 

### - TabBar 
TabBar con 2 Tabs que representan el **HomeView Screen** con un listados de los albunes en tendencia y el **Categories Screen** con un listado de Géneros.

### - HomeView Screen

En esta pantalla podras observar los Albums con cierta descripción como el nombre del album, nombre del artista, fecha de lanzamiento y la portada  
esta data cual fue solicitada mediante la **API**, que fue utilizando **Closures** para realizar la comunicación con el **ViewModel** una vez obtenido
el listado de los releases.

<img width="465" alt="Captura de pantalla 2023-02-10 a la(s) 21 14 52" src="https://user-images.githubusercontent.com/51270295/218226329-4bbfc98d-e31b-47f1-86ba-9ee89446faa8.png">

### - Categories Screen
La pantalla de Generos muestra un listado de los géneros musicales solicitados en la **API**.

<img width="467" alt="Captura de pantalla 2023-02-10 a la(s) 21 15 23" src="https://user-images.githubusercontent.com/51270295/218226354-7b8cfe08-dd91-44f8-be84-6da8011a6ed7.png">


### - Artist Screen
En esta pantalla podras obserbar la descripcion y detalles del artista del Album seleccionado en el **HomeView Screen**, el cual te brinda la información
del nombre del artista, seguidores, y géneros musicales.

<img width="468" alt="Captura de pantalla 2023-02-10 a la(s) 21 15 09" src="https://user-images.githubusercontent.com/51270295/218226364-1562a09e-d9f1-4c95-8736-42d577933974.png">


### Mejoras a realizar

Para poder cumplir con la fecha indicada de entrega hay ciertas mejoras a realizar al proyecto.

- Mejorar el aspecto visual en General.
- Crear Archivos independientes para DataSource y Delegados de las Tablas.
- Aplicar testing.


Para el correcto uso de la app es necesario que siga las instrucciones de la Web de Spotify y cree una cuenta para desarrolladores. 
Ya que es necesario que tengamos acceso a un **Client ID** para poder acceder a la URL y con ello obtener el ApiToken. 
Info: https://developer.spotify.com/

